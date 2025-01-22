class TmdbService
  include HTTParty
  base_uri "https://api.themoviedb.org/3"

  def initialize(api_key = ENV["TMDB_API_KEY"])
    @api_key = api_key
  end

  def search_movies(query)
    self.class.get("/search/movie", query: { api_key: @api_key, query: query })
  end
end
