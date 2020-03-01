desc "import all csv files"
namespace :import do
  task :all => [:olympians, :events, :olympian_events]
end
