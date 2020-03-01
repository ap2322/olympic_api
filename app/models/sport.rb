class Sport < ApplicationRecord
  validates :sport, uniqueness: true, presence: true

  has_many :olympians
  has_many :events
end
