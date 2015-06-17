class Scene < ActiveRecord::Base
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  has_many :scene_connectors, foreign_key: :scene_from_id
  has_many :reverse_scene_connectors, class_name: :SceneConnector, foreign_key: :scene_to_id

  has_many :scenes, through: :scene_connectors, source: :scene_to
  has_many :events
  has_many :event_parts, through: :events
  has_many :event_answers, through: :event_parts

  has_attached_file :image, styles: {thumb: "100x100>"}, default_url: "/images/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :title, presence: true

  def to_view
    content_tag(:div, id: :main_scene, style: "background-image: url(#{image.url});") do
      scene_header +
      connector_buttons
    end.html_safe
  end

  def connector_buttons
    scene_connectors.collect(&:to_button).join.html_safe
  end

  private

    def scene_header
      content_tag(:div, class: :bordered_box_black, id: :scene_header) do
        content_tag(:h3, title, id: :main_scene_header)
      end.html_safe
    end
end
