class OlympianSerializer
  attr_reader :name, :age, :team, :sport, :total_medals_won

  def initialize(olympian)
    @name = olympian.name
    @age = olympian.age
    @team = olympian.country.team
    @sport = olympian.sport.sport
    @total_medals_won = olympian.medals_won
  end

end
