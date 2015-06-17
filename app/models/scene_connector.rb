class SceneConnector < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  belongs_to :scene_from, class_name: :Scene
  belongs_to :scene_to, class_name: :Scene

  validates :position_x, presence: true, inclusion: 1..1024
  validates :position_y, presence: true, inclusion: 1..768

  delegate :name, to: :scene_from, prefix: true
  delegate :name, to: :scene_to, prefix: true

  class << self

    def build_bidirectional(scene_from_id, scene_to_id, options = {})
      raise "You need to specify 'from' and 'to', like: 'from: {position_x: 100, position_y: 150}, " \
            "to: {position_x: 200, position_y: 50}'" unless bidirectional_options_set_correct?(options)
      [new(options.fetch(:to).merge(scene_from_id: scene_from_id, scene_to_id: scene_to_id)),
       new(options.fetch(:from).merge(scene_to_id: scene_from_id, scene_from_id: scene_to_id))]
    end

    private

      def bidirectional_options_set_correct?(options)
        options[:to].present? && options[:from].present? &&
        options[:to][:position_x].present? && options[:to][:position_y].present? &&
        options[:from][:position_x].present? && options[:from][:position_y].present?
      end

  end

  def to_button
    link_to(scene_to.name,
            render_scene_path(scene_id: scene_to.id, scene_connector_id: id),
            remote: true,
            class: [:scene_connector, :bordered_box_black],
            style: "top: #{position_y}px; left: #{position_x}px;")
  end

end
