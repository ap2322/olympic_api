class OlympianEvent < ApplicationRecord
  belongs_to :olympian
  belongs_to :event

  enum medal: ['NA', 'Bronze', 'Silver', 'Gold'] 
end
