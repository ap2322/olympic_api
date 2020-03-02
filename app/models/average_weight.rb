class AverageWeight

  attr_reader :unit, :male_olympians, :female_olympians

  def initialize(olympians)
    @unit = "kg"
    @male_olympians = olympians.average_weight_male
    @female_olympians = olympians.average_weight_female
  end
  
end
