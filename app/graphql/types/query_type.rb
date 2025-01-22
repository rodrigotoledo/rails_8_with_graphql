module Types
  class QueryType < Types::BaseObject
    field :search_movies, [ Types::MovieType ], null: false do
      argument :query, String, required: true
    end

    def search_movies(query:)
      service = TmdbService.new
      response = service.search_movies(query)
      response["results"].map do |movie|
        {
          id: movie["id"],
          title: movie["title"],
          overview: movie["overview"],
          release_date: movie["release_date"]
        }
      end
    end
  end
end
