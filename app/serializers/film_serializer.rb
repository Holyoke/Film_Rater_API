class FilmSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url_slug, :year
end
