require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning database..."
Bookmark.destroy_all
Log.destroy_all
Book.destroy_all
User.destroy_all

puts "Creating Users..."

User.create([
  { email: "kyo@example.com", password: "123456", user_name: "Kyo" },
  { email: "jun@example.com", password: "123456", user_name: "Jun"  }
])

puts "finished creating users!!"

puts "Creating Books..."

url = "https://www.googleapis.com/books/v1/volumes?q=かこさとし"
@data = JSON.parse(URI.open(url).read)

@data["results"].each do |book|
  Book.create!(name: book["title"], author: book["overview"], published_at: book["poster_path"], publisher: book["vote_average"], original_price: book[""])
end
puts "done!"
