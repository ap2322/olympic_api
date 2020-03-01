desc "import all of the 2016_summer_olympic_data.csv"
namespace :import do
  task :all => [:olympians, :events, :olympian_events]
end
