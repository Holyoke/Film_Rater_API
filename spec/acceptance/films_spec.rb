require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'acceptance_helper'

resource "Films" do
  header "Accept", "application/json"
  header "Content-Type", "application/json"

  get "/api/films" do
    example "Retrieving a list of films" do
      explanation "Film#Index"
      do_request
      expect(status).to eq 200

      json = JSON.parse(response_body)
      json_films = json["data"]
      expect(json_films.length).to eq(Film.count)
    end
  end

  get "/api/films/1" do
    example "Fetching a specific film" do
      explanation "Film#Show"
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
