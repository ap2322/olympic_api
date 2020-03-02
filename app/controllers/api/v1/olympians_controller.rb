class Api::V1::OlympiansController < ApplicationController

  def index
    olympians = Olympian.all
    olympians_serialized = OlympianSerializer.new(olympians)
    olympians_as_hash = ReformatOlympians.new(olympians_serialized.serializable_hash)

    render json: olympians_as_hash, status: 200
  end

end
