class Olympian < ApplicationRecord
  validates_presence_of :sex, :age, :height, :weight
  validates :name, presence: true, uniqueness: true

  has_many :olympian_events
  belongs_to :country
  belongs_to :sport
end
