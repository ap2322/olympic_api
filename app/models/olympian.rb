class Olympian < ApplicationRecord
  validates_presence_of :sex, :age, :height, :weight
  validates :name, presence: true, uniqueness: true
end
