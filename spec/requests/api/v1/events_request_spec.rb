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

    it 'returns an empty array for no events in db' do

      allow(Sport).to receive_message_chain(:includes, :order, :all) { [] }

      get '/api/v1/events'
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to have_key :events
      expect(parsed_response[:events].length).to eq 0

    end
  end

  describe "get one event's medalists" do
    it "gets the event name with array of medalists" do
      id = Event.find_by(event: "Badminton Mixed Doubles").id
      get "/api/v1/events/#{id}/medalists"

      expect(response.status).to eq 200

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to have_key :event
      expect(parsed_response).to have_key :medalists
      expect(parsed_response[:medalists][0]).to have_key :name
      expect(parsed_response[:medalists][0]).to have_key :team
      expect(parsed_response[:medalists][0]).to have_key :age
      expect(parsed_response[:medalists][0]).to have_key :medal
    end

    it "gracefully handles no medalists" do
      id = Event.find_by(event: "Weightlifting Women's Super-Heavyweight").id
      get "/api/v1/events/#{id}/medalists"

      expect(response.status).to eq 200

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expected_response = {:event=>"Weightlifting Women's Super-Heavyweight", :medalists=>[]}
      
      expect(parsed_response).to eq expected_response
    end
  end
end
