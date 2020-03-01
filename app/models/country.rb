class Country < ApplicationRecord
  validates :team, uniqueness: true, presence: true
end
