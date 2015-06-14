class EventPart < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  belongs_to :event
  has_many :event_answers

  has_attached_file :image, :styles => {:thumb => "100x100>"}, :default_url => "/images/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def to_view
    link_to('', action: next_type, controller: :application, "#{next_type}_id": next_id) do
      content_tag(:div, id: 'main_scene', style:"background-image: url(#{image.url});") do
        Events::EventAnswersDisplay.new(event_answers).call.html_safe +
        Events::EventTextDisplay.new(self).call.html_safe
      end.html_safe
    end.html_safe
  end

end
