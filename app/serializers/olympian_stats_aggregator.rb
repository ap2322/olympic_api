class OlympianStatsAggregator

  def initialize(olympians)
    @olympians = olympians
  end

  def total_competing_olympians
    @olympians.count
  end

  def average_age
    @olympians.average(:age).round(0)
  end

  def average_weight
    {
      unit: "kg",
      male_olympians: @olympians.where(sex: "M").average(:weight).round(1),
      female_olympians: @olympians.where(sex: "F").average(:weight).round(1)
    }
  end

  def full_stats
    {
      total_competing_olympians: total_competing_olympians,
      average_weight: average_weight,
      average_age: average_age
    }
  end
end
