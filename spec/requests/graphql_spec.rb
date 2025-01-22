require 'rails_helper'

RSpec.describe 'GraphQL API', type: :request do
  let(:api_key) { ENV['TMDB_API_KEY'] }
  let!(:movie_title){ 'John Wick: Chapter 4'}

  describe 'searchMovies' do
    let(:query) do
      <<-GRAPHQL
        query {
          searchMovies(query: "#{movie_title}") {
            id
            title
            overview
            releaseDate
          }
        }
      GRAPHQL
    end

    it 'returns a list of movies from the database (if available)' do
      post '/graphql', params: { query: query }.to_json, headers: { 'Content-Type' => 'application/json' }

      json = JSON.parse(response.body)

      expect(json['data']['searchMovies']).to be_an(Array)
      expect(json['data']['searchMovies'].first['title']).to eq(movie_title)
      expect(json['data']['searchMovies'].first['overview']).not_to be_empty
      expect(json['data']['searchMovies'].first['releaseDate']).not_to be_empty
    end
  end
end
