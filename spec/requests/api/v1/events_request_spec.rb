require 'rails_helper'

RSpec.describe 'Events API', :type => :request do
  describe 'get all events endpoint' do
    it 'gets all events successfully' do
      get '/api/v1/events'
      expect(response.status).to eq 200

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to have_key :events
      expect(parsed_response[:events][0]).to have_key :sport
      expect(parsed_response[:events][0]).to have_key :events

    end
  end
end
