class Sport < ApplicationRecord
  validates :sport, uniqueness: true, presence: true
end
