class EventPart < ActiveRecord::Base
  belongs_to :event
  has_many :event_answers

  has_attached_file :image, :default_url => "/images/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def to_view
    content_tag(:div, id: 'main_scene', style:"background-image: url(#{image.url});") do
      Events::EventAnswersDisplay.new(event_answers).call +
      Events::EventTextDisplay.new(self).call
    end.html_safe
  end

end
