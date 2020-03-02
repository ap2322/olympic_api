require 'rails_helper'

RSpec.describe 'Olympians API', :type => :request do
  describe 'get all olympians endpoint' do
    it 'gets all olympians successfully' do
      get '/api/v1/olympians'

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      # binding.pry
      expect(parsed_response).to have_key :olympians
      expect(parsed_response[:olympians][0]).to have_key :name
      expect(parsed_response[:olympians][0]).to have_key :team
      expect(parsed_response[:olympians][0]).to have_key :age
      expect(parsed_response[:olympians][0]).to have_key :sport
      expect(parsed_response[:olympians][0]).to have_key :total_medals_won

      expect(parsed_response[:olympians].length).to be > 1

      # {
      #   "olympians":
      #     [
      #       {
      #         "name": "Maha Abdalsalam",
      #         "team": "Egypt",
      #         "age": 18,
      #         "sport": "Diving"
      #         "total_medals_won": 0
      #       },
      #       {
      #         "name": "Ahmad Abughaush",
      #         "team": "Jordan",
      #         "age": 20,
      #         "sport": "Taekwondo"
      #         "total_medals_won": 1
      #       },
      #       {...}
      #     ]
      # }
    end
  end
end
