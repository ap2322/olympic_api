class SerializableOlympian < JSONAPI::Serializable::Resource
  type 'olympians'

  attributes :name, :age

  attribute :team do
    @object.country.team
  end

  attribute :sport do
    @object.sport.sport
  end

  attribute :medals do
     @object.olympian_events.where(medal: [1, 2, 3]).count
  end

end
