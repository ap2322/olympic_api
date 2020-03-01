class Event < ApplicationRecord
  validates :event, presence: true, uniqueness: true
end
