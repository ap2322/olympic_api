require 'csv'
require 'activerecord-import'

desc "individual tasks for importing Summer Olympic Data from file"
namespace :import do
  task :olympians => [:environment] do
    file = "db/2016_summer_olympic_data.csv"
    CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
      row_hash = row.to_h
      country = Country.find_or_create_by(team: row_hash[:team])
      sport = Sport.find_or_create_by(sport: row_hash[:sport])
      Olympian.create({ name: row_hash[:name],
                        sex: row_hash[:sex],
                        age: row_hash[:age],
                        height: row_hash[:height],
                        weight: row_hash[:weight],
                        country_id: country.id,
                        sport_id: sport.id,
                      })
    end
  end

  task :events => [:environment] do
    file = "db/2016_summer_olympic_data.csv"

    CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
      row_hash = row.to_h
      sport = Sport.find_or_create_by(sport: row_hash[:sport])
      Event.create({ event: row_hash[:event],
                     sport_id: sport.id
                  })
    end
  end

  task :olympian_events => [:environment] do
    file = "db/2016_summer_olympic_data.csv"
    olympian_events_array = []
    CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
      row_hash = row.to_h
      olympian = Olympian.find_by(name: row_hash[:name])
      event = Event.find_by(event: row_hash[:event])

      olympian_events_array.push({  olympian_id: olympian.id,
                              event_id: event.id,
                              medal: row_hash[:medal]
                          })
    end
    OlympianEvent.import(olympian_events_array)
  end

  task :sports => [:environment] do
    file = "db/2016_summer_olympic_data.csv"

    CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
      Sport.create(sport: row.to_h[:sport])
    end
  end

  task :countries => [:environment] do
    file = "db/2016_summer_olympic_data.csv"

    CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
      Country.create(team: row.to_h[:team])
    end
  end

end
