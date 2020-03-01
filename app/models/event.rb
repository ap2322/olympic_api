class Event < ApplicationRecord
  validates :event, presence: true, uniqueness: true

  belongs_to :sport
  has_many :olympian_events
end
