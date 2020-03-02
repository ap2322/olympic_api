class ReformatOlympians
  attr_reader :olympians

  def initialize(collection)
    @olympians = reformat(collection[:data])
  end

  def reformat(olympian_array)
    olympian_array.map do |obj|
      obj = obj[:attributes]
    end
  end
end
