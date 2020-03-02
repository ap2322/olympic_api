class Api::V1::TeamsController < ApplicationController

  def index
    teams = Country.includes(:olympians).all
    teams_serialized = teams.map do |team|
      TeamSerializer.new(team)
    end
    response = { teams: teams_serialized}
    
    render json: response, status: 200
  end
end
