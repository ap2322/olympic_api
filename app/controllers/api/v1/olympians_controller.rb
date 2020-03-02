class Api::V1::OlympiansController < ApplicationController

  def index
    olympians = fetch_olympians(params[:age])

    if olympians.count > 0
      olympians_serialized = OlympianSerializer.new(olympians)
      olympians_as_hash = ReformatOlympians.new(olympians_serialized.serializable_hash)

      render json: olympians_as_hash, status: 200
    else
      response_hash = { olympians: []}
      render json: response_hash, status: 200
    end
  end

  private
  def fetch_olympians(age_param)
    case age_param
    when nil
      Olympian.all
    when 'youngest'
      Olympian.find_youngest
    when 'oldest'
      Olympian.find_oldest
    end
  end

end
