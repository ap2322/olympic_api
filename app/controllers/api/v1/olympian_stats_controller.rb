class Api::V1::OlympianStatsController < ApplicationController

  def show
    olympians = Olympian.all
    if olympians.count > 0
      fetch_olympian_stats = OlympianStatsAggregator.new(olympians)
      response = { olympian_stats: fetch_olympian_stats }
      render json: response, status: 200
    else
      response = { error: "Not enough olympians for statistics"}
      render json: response, status: 404
    end
  end

end
