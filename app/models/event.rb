class Event < ActiveRecord::Base
  belongs_to :scene
  has_many :event_parts
  has_many :event_answers, through: :event_parts

  validates :name, presence: true

  delegate :name, to: :scene, prefix: true

  def start_event_part
    event_parts.first
  end
end
