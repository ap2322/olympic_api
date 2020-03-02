class Sport < ApplicationRecord
  validates :sport, uniqueness: true, presence: true

  has_many :olympians
  has_many :events

  def events_of_sport
    events.pluck(:event)
  end
end
