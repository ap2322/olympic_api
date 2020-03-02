class Api::V1::OlympiansController < ApplicationController

  def index
    olympians = Olympian.all

    render jsonapi: olympians,
           fields: {olympians: [:name, :age, :team, :sport, :medals]},
           status: 200
  end

end
