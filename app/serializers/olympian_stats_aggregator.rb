class OlympianStatsAggregator
  attr_reader :total_competing_olympians,
              :average_weight,
              :average_age

  def initialize(olympians)
    @total_competing_olympians = olympians.total_competing_olympians
    @average_weight = AverageWeight.new(olympians)
    @average_age = olympians.average_age

  end

end
