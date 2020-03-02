class Api::V1::EventsController < ApplicationController

  def index
    sports = Sport.includes(:events).order(:sport).all
    if sports.count > 0
      events_for_response = AggregateEventSports.build(sports)
      response = { events: events_for_response }

      render json: response, status: 200
    else
      render error
    end
  end

end
