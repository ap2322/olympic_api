class OlympianStatsAggregator

  def initialize(olympians)
    @olympians = olympians
  end

  def full_stats
    {
      total_competing_olympians: @olympians.total_competing_olympians,
      average_weight: { unit: 'kg',
                        male_olympians: @olympians.average_weight_male,
                        female_olympians: @olympians.average_weight_female
                      },
      average_age: @olympians.average_age
    }
  end
end
