# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# puts 'Creating 15 fake movies...'
# 15.times do
#   movie = Movie.new(
#     name: Faker::Movie.title,
#     overview: Faker::Address.full_address,
#     poster_url: Faker::Mountain.range,
#     rating: rand(50...150),
#   )
#   movie.save!
# end
# puts 'Finished!'

url = 'http://tmdb.lewagon.com/movie/top_rated'
response = URI.open(url).read
movies = JSON.parse(response)
movies['results'].each do |movie|
  # byebug
  film = Movie.new(
        title: movie['title'],
        overview: movie['overview'],
        poster_url: movie['poster_url'],
        rating: movie['vote_average']
      )
      film.save!
end
