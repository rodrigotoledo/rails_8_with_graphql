# Rails GraphQL API Project

This is a sample Rails project with a GraphQL API that integrates with The Movie Database (TMDb) API. It allows searching for movies and displaying results through a GraphQL endpoint.

## With Docker

Need To Clean All Your Docker?

```bash
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi -f $(docker images -aq)
docker system prune -a --volumes -f
docker network rm $(docker network ls -q)
rm .db-created
rm .db-seeded
rm Gemfile.lock
```

### Putting In Development Mode

Whereas It Is Necessary To Run With Your User, Run

```bash
id -u
```

And Change The Dockerfile.Development File With The Value You Found

So Build You Just Need To Run The First Time:

```bash
docker compose -f docker-compose.development.yml build
```

And To Climb The Application Rode:

```bash
docker compose -f docker-compose.development.yml up
docker compose -f docker-compose.development.yml down
docker compose -f docker-compose.development.yml run app bash
```

### Migrations

To Run Migrations, Tests ... Etc, Run The App With Whatever Is Needed:

```bash
docker compose -f docker-compose.development.yml run app rails db:drop db:create db:migrate
```

## Features

- GraphQL API setup for movie search.
- Integration with The Movie Database (TMDb) API for fetching movie data.
- RSpec tests for API and database interaction.
- Continuous Integration (CI) setup with GitHub Actions.

## Getting Started

### Prerequisites

To run this project locally, ensure you have the following installed:

- Ruby (preferably using `rbenv` or `asdf2`)
- Rails
- SQLite3 (for local development and testing)

### Installation

1. Clone the repository:

```bash
  git clone https://github.com/rodrigtoledo/rails_8_with_graphql.git
  cd rails_8_with_graphql
```

2. Install dependencies:

```bash
bundle install
```

3. Set up the database:

```bash
bin/rails db:create db:schema:load
```

4. Set up your environment variables. You'll need to create a .env file with the following:

```bash
TMDB_API_KEY=your_tmdb_api_key
```

### Running the Application

1. Start the Rails server:

```bash
bin/rails server
```

2. Use the postman collection:

```graphql
query {
  searchMovies(query: "Inception") {
    id
    title
    overview
    releaseDate
  }
}
```

## Testing

This project uses RSpec for testing.

Running Tests Locally
To run the tests locally:

1. Prepare the test database:

```bash
bin/rails db:test:prepare
```

2. Run the tests:

```bash
bundle exec guard
```

## Testing with Docker

For Tests For Example Run `Guard`:

```bash
docker compose -f docker-compose.development.yml run app bundle exec guard
```

## CI/CD with GitHub Actions

This project includes a CI/CD pipeline setup using GitHub Actions. The pipeline runs tests and checks for code quality on each push or pull request to the main branch.

The pipeline includes:

- Static code analysis with Brakeman for security vulnerabilities.
- Linting with RuboCop.
- Running tests with RSpec using SQLite as the database.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
