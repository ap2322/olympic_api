class Api::V1::Events::MedalistsController < ApplicationController

  def show
    event = Event.find(params[:id])
    medalists = event.fetch_olympians_medalists

    medalists_serialized = medalists.map do |olympian|
      MedalistSerialized.new(olympian)
    end
    response = { event: event.event, medalists: medalists_serialized}

    render json: response, status: 200
  end
end
