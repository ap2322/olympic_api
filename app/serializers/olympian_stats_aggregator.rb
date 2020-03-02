class OlympianStatsAggregator
  attr_reader :total_competing_olympians,
              :average_weight,
              :average_age

  def initialize(olympians)
    @total_competing_olympians = olympians.total_competing_olympians
    @average_weight = average_weight(olympians)
    @average_age = olympians.average_age

  end

  def average_weight(olympians)
    { unit: 'kg',
      male_olympians: olympians.average_weight_male,
      female_olympians: olympians.average_weight_female
    }
  end

end
