class Scene < ActiveRecord::Base
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  has_many :scene_connectors, foreign_key: :scene_from_id, dependent: :destroy
  has_many :reverse_scene_connectors, class_name: :SceneConnector, foreign_key: :scene_to_id, dependent: :destroy

  has_many :scenes, :through => :scene_connectors, :source => :scene_to
  has_many :events
  has_many :event_parts, :through => :events
  has_many :event_answers, :through => :event_parts

	has_attached_file :image, :default_url => "/images/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def to_view
    content_tag(:div, id: 'main_scene', style:"background-image: url(#{image.url});") do
      content_tag(:h1, name) +
      connector_buttons
    end.html_safe
  end

  def connector_buttons
    scene_connectors.collect(&:to_button).join.html_safe
  end
end
