class Api::V1::OlympianStatsController < ApplicationController

  def show
    fetch_olympian_stats = OlympianStatsAggregator.new(Olympian.all)
    response = { olympian_stats: fetch_olympian_stats }
    render json: response, status: 200
  end

end
