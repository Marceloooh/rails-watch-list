require 'faker'
# require "nokogiri"
require "open-uri"
require "json"

url = 'https://tmdb.lewagon.com/movie/top_rated'
html = URI.open(url)
movies_file = File.read(html)
movies = JSON.parse(movies_file)['results']

puts "---Cleaning database..."
Movie.destroy_all

# 20.times do
#   movie = Movie.create(title: Faker::Movie.title, overview: Faker::Movie.quote, poster_url: "https://placeimg.com/640/480/arch", rating: Faker::Number.decimal(l_digits: 1, r_digits: 1) )
#   puts "#{movie.title} is created"
# end

movies.each do |movie|
  title = movie['original_title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  rating = movie['vote_average']
  movie = Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating )
  puts "#{movie.title} is created"
end

puts "---Finished!"

# puts "#{movies[0]['original_title']}"
