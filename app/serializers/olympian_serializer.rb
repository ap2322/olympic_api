class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age, :team, :sport, :total_medals_won

  attribute :team do |object|
    object.country.team
  end

  attribute :sport do |object|
    object.sport.sport
  end

  attribute :total_medals_won do |object|
    object.olympian_events.where(medal: [1, 2, 3]).count
  end

end
