class TeamSerializer
  attr_reader :team, :olympian_stats
  
  def initialize(team)
    @team = team.team
    @olympian_stats = OlympianStatsAggregator.new(team.olympians)
  end

end
