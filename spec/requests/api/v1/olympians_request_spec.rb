require 'rails_helper'

RSpec.describe 'Olympians API', :type => :request do
  describe 'get all olympians endpoint' do
    it 'gets all olympians successfully' do
      get '/api/v1/olympians'

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to have_key :olympians
      expect(parsed_response[:olympians][0]).to have_key :name
      expect(parsed_response[:olympians][0]).to have_key :team
      expect(parsed_response[:olympians][0]).to have_key :age
      expect(parsed_response[:olympians][0]).to have_key :sport
      expect(parsed_response[:olympians][0]).to have_key :total_medals_won

      expect(parsed_response[:olympians].length).to be > 1
    end

    it 'returns an empty array for no olympians in db' do

      allow(Olympian).to receive(:all) { [] }
      get '/api/v1/olympians'
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to have_key :olympians
      expect(parsed_response[:olympians].length).to eq 0

    end
  end
end
