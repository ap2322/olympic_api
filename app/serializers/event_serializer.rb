class EventSerializer
  attr_reader :sport, :events

  def initialize(sport)
    @sport = sport.sport
    @events = sport.events_of_sport
  end

end
