require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'acceptance_helper'

resource "Ratings" do
  header "Accept", "application/json"
  header "Content-Type", "application/json"

  post "/api/ratings" do
    parameter :film_id, "id for film", required: true
    parameter :score, "integer score for rating between 0 to 100", scope: :rating, required: true

    let(:film_id) { Film.first.id }
    let(:score) { 75 }
    let(:raw_post) { params.to_json }

    example "Submitting a rating to a film" do
      explanation "Rating#Create"
      do_request
      expect(status).to eq 201
    end
  end
end
