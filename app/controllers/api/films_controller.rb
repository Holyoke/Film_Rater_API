class Api::FilmsController < ApplicationController
  def index
    films = Film.all
    render json: films
  end

  def show
    film = Film.find(params[:id])
    render json: film
  end
end
