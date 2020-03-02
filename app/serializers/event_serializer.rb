class EventSerializer
  attr_reader :sport, :events

  def initialize(sport)
    @sport = sport.sport
    @events = events_of_sport(sport)
  end

  def events_of_sport(sport)
    sport.events.pluck(:event)
  end


end
