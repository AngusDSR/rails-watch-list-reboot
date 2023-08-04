require 'faker'
require 'open-uri'
require 'json'

puts 'Clearing db...'
Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

results = movies['results']

results.each do |movie|
  puts 'Adding move from list...'
  title = movie['title']
  overview = movie['overview']
  rating = movie['vote_average']
  poster_url = "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}"
  movie = Movie.new(
    title:,
    overview:,
    rating:,
    poster_url:
  )
  movie.save
end

puts "#{Movie.all.size} created"
