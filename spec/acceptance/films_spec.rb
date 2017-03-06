require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'acceptance_helper'

resource "Films" do
  get "/api/films" do
    example "Listing films" do
      explanation "Retrieves an index of films"
      do_request
      expect(status).to eq 200

      json = JSON.parse(response.body)
      json_films = json["data"]
      expect(json_films.length).to eq(Film.count)
    end
  end

  get "/api/films/1" do
    example "Listing films" do
      explanation "Retrieves a specific film"
      do_request
      expect(status).to eq 200
    end
  end
end
