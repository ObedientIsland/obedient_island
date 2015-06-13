class SceneConnector < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  belongs_to :scene_from, :class_name => :Scene
  belongs_to :scene_to, :class_name => :Scene

  class << self

    def create_bidirectional(scene_from, scene_to, options = {})
      raise "You need to specify 'from' and 'to', like: 'from: {position_x: 100, position_y: 150}, " \
            "to: {position_x: 200, position_y: 50}'" unless bidirectional_options_set_correct?(options)
      [create(options.fetch(:to).merge(scene_from: scene_from, scene_to: scene_to)),
       create(options.fetch(:from).merge(scene_to: scene_from, scene_from: scene_to))]
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
            scene_path(scene_id: scene_to.id, scene_connector_id: id),
            remote: true,
            class: :scene_connector,
            style: "top: #{position_y}px; left: #{position_x}px;")
  end

end
