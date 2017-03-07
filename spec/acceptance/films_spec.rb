require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'acceptance_helper'

require 'byebug'

resource "Films" do
  get "/api/films" do
    example "Film Index" do
      explanation "Retrieves an index of films"
      do_request
      expect(status).to eq 200

      json = JSON.parse(response_body)
      json_films = json["data"]
      expect(json_films.length).to eq(Film.count)
    end
  end

  get "/api/films/1" do
    example "Film Show" do
      explanation "Retrieves a specific film"
      do_request
      expect(status).to eq 200

      json = JSON.parse(response_body)
      json_film = json["data"]
      film = Film.find(json_film["id"]).slice(:id, :title, :description, :url_slug, :year)

      expect(json_film["attributes"]["title"]).to eq(film[:title])
      expect(json_film["attributes"]["description"]).to eq(film[:description])
      expect(json_film["attributes"]["url-slug"]).to eq(film[:url_slug])
      expect(json_film["attributes"]["year"]).to eq(film[:year])
    end
  end
end
