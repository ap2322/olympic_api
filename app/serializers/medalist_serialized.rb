class MedalistSerialized

  def initialize(olympian)
    @name = olympian.name
    @team = olympian.country.team
    @age = olympian.age
    @medal = olympian.event_medal
  end
end
