class EventPart < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  belongs_to :event
  has_many :event_answers

  has_attached_file :image, styles: {thumb: "100x100>"}, default_url: "/images/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :title, :text, :next_type, :next_id, presence: true

  delegate :name, to: :event, prefix: true

  def to_view
    event_answers.exists? ? to_view_with_answers : to_view_without_answers
  end

  private

    def to_view_with_answers
      event_part_main_scene_tag do
        Events::EventAnswersDisplay.new(event_answers).call.html_safe +
        Events::EventTextDisplay.new(self).call.html_safe
      end
    end

    def to_view_without_answers
      link_to(send("render_#{next_type}_path", "#{next_type}_id": next_id), remote: true) do
        event_part_main_scene_tag do
          content_tag(:div, nil, class: :event_answer_box).html_safe +
          Events::EventTextDisplay.new(self).call.html_safe
        end
      end.html_safe
    end

    def event_part_main_scene_tag
      content_tag(:div, id: 'main_scene', style:"background-image: url(#{image.url});") do
        yield
      end.html_safe
    end

end
