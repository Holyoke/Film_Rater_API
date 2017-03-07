class FilmSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url_slug, :year, :average_rating

  def average_rating
    object.ratings.average(:score).to_f
  end
end
