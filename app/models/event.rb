class Event < ActiveRecord::Base
  belongs_to :scene
  has_many :event_parts
  has_many :event_answers, through: :event_parts
end
