class Api::FilmsController < ApplicationController
  def index
    films = Film.all
    render json: films, fields: { films: attribute_params }
  end

  def show
    film = Film.find(params[:id])
    render json: film, fields: { films: attribute_params }
  end

  def attribute_params
    params[:fields] ||= [:id, :title, :description, :url_slug, :year, :average_rating]
    params[:fields]
  end
end
