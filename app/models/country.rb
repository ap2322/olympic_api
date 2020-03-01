class Country < ApplicationRecord
  validates :team, uniqueness: true, presence: true

  has_many :olympians
end
