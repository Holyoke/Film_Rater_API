class Api::RatingsController < ApplicationController
  before_action :set_film

  def create
    rating = @film.ratings.new(rating_params)
    if rating.save
      render json: rating, status: :created
    else
      render json: rating.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def set_film
      @film = Film.find(params[:film_id])
    end

    def rating_params
      params.require(:rating).permit(:score)
    end
end
