require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'acceptance_helper'

require 'byebug'

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

  get "/api/films/:id" do
    let(:id) { Film.first.id }

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

  get "/api/films/:id" do
    parameter :year, "year of film", scope: "fields[]"
    parameter :title, "title of film", scope: "fields[]"
    parameter :description, "description of film", scope: "fields[]"
    parameter :url_slug, "url_slug of film", scope: "fields[]"
    parameter :average_rating, "average_rating of film", scope: "fields[]"

    let(:raw_post) { {fields: [:year, :title]} }
    let(:id) { Film.first.id }

    example "Filtering attributes retrieving a film" do
      explanation "Filtering film resources' attributes by passing in an array of attributes. \n All attributes are returned by default. Note that params are passed in as an array."
      do_request
      expect(status).to eq 200

      json = JSON.parse(response_body)
      json_film = json["data"]
      film = Film.find(json_film["id"]).slice(:id, :title, :description, :url_slug, :year)
      expect(json_film["attributes"]["year"]).to eq(film[:year])
      expect(json_film["attributes"]["title"]).to eq(film[:title])
      expect(json_film["attributes"]["description"]).to be_nil
    end
  end

  get "/api/films/" do
    parameter :year, "year of film", scope: "fields[]"
    parameter :title, "title of film", scope: "fields[]"
    parameter :description, "description of film", scope: "fields[]"
    parameter :url_slug, "url_slug of film", scope: "fields[]"
    parameter :average_rating, "average_rating of film", scope: "fields[]"

    let(:raw_post) { {fields: [:url_slug, :average_rating]} }

    example "Filtering attributes on a list of films" do
      explanation "Filtering film resources' attributes by passing in an array of attributes. \n All attributes are returned by default. Note that params are passed in as an array."
      do_request
      expect(status).to eq 200
    end
  end
end
