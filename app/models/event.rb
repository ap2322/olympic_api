class Event < ApplicationRecord
  validates :event, presence: true, uniqueness: true

  belongs_to :sport
  has_many :olympian_events

  def fetch_olympians_medalists
    olympian_ids = olympian_events.where(medal: [1,2,3]).pluck(:olympian_id)
    Olympian.where(id: olympian_ids)
  end
end
