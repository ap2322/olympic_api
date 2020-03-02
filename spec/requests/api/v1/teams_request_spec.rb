require 'rails_helper'

RSpec.describe 'Teams API', :type => :request do
  describe 'get all teams endpoint' do
    it 'gets all teams successfully' do
      get '/api/v1/teams'
      expect(response.status).to eq 200

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to have_key :teams
      expect(parsed_response[:teams][0]).to have_key :team
      expect(parsed_response[:teams][0]).to have_key :olympian_stats

    end

    it 'returns an empty array for no teams in db' do

      allow(Country).to receive_message_chain(:includes, :order, :all) { [] }

      get '/api/v1/teams'
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to have_key :teams
      expect(parsed_response[:teams].length).to eq 0

    end
  end
end
