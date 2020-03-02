class AggregateEventSports

  def self.build(sports)
    sports.map do |sport|
      EventSerializer.new(sport)
    end
  end
end
