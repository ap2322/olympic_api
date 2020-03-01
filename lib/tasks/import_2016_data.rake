require 'csv'

desc "import 2016 Summer Olympic Data from file"
namespace :import do
  task :olympians => [:environment] do
    file = "db/2016_summer_olympic_data.csv"

    CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
      row_hash = row.to_h
      Olympian.create({ name: row_hash[:name],
                        sex: row_hash[:sex],
                        age: row_hash[:age],
                        height: row_hash[:height],
                        weight: row_hash[:weight]
                      })
    end
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

  task :events => [:environment] do
    file = "db/2016_summer_olympic_data.csv"

    CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
      Event.create({event: row.to_h[:event]})
    end
  end
end
