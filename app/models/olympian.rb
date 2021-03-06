class Olympian < ApplicationRecord
  validates_presence_of :sex, :age, :height, :weight
  validates :name, presence: true, uniqueness: true

  has_many :olympian_events, dependent: :delete_all
  belongs_to :country
  belongs_to :sport

  def medals_won
    olympian_events.where(medal: [1, 2, 3]).count
  end

  def self.find_youngest
    [ select("*, MIN(age)").group(:id).order(:age).first ]
  end

  def self.find_oldest
    [ select("*, MAX(age)").group(:id).order(age: :desc).first ]
  end

  def self.total_competing_olympians
    count
  end

  def self.average_age
    avg_age = average(:age)
    unless avg_age.nil?
      avg_age.round(0).to_i
    end
  end

  def self.average_weight_male
    avg_weight = where(sex: "M").average(:weight)
    unless avg_weight.nil?
      avg_weight.round(1).to_f
    end
  end

  def self.average_weight_female
    avg_weight = where(sex: "F").average(:weight)
    unless avg_weight.nil?
      avg_weight.round(1).to_f
    end
  end

  def event_medal
    olympian_events.pluck(:medal).first
  end
end
