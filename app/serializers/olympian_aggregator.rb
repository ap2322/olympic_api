class OlympianAggregator

  def self.build(olympians)
    olympians.map do |olympian|
      OlympianSerializer.new(olympian)
    end
  end
end
