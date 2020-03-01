class Api::V1::OlympiansController < ApplicationController

  def index
    olympians = Olympian.all
    # forecast = ForecastFacade.new(params['location'])
    options = {}
    options[:is_collection] = true
    options[:fields] = { olympian: [:name]}

    olympians_response_as_hash = OlympianSerializer.new(olympians, options).serializable_hash
    olympians_response_as_hash[:olympians] = olympians_response_as_hash.delete(:data)
    binding.pry
    render json: olympians_response_as_hash
  end

end
