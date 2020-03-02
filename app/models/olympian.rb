class Olympian < ApplicationRecord
  validates_presence_of :sex, :age, :height, :weight
  validates :name, presence: true, uniqueness: true

  has_many :olympian_events, dependent: :delete_all
  belongs_to :country
  belongs_to :sport


  def self.find_youngest
    [ select("*, MIN(age)").group(:id).order(:age).first ]
  end

  def self.find_oldest
    [ select("*, MAX(age)").group(:id).order(age: :desc).first ]
  end
end
