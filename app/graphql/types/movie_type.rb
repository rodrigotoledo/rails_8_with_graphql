module Types
  class MovieType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :overview, String, null: true
    field :release_date, String, null: true
  end
end
