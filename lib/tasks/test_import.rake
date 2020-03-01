require 'csv'

desc "import customers from csv file"
namespace :import do
  task :test => [:environment] do
    file = "db/2016_summer_olympic_data.csv"

    CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
      Test.create(row.to_h)
    end
  end
end
