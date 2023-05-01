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

Book.create([
  { name: "だるまちゃんとキジムナちゃん", author: "かこさとし", published_at: "2000/10/10", publisher: "本の雑誌社", original_price: 1800 },
  { name: "だるまちゃんとだるまちゃん", author: "かこさとし", published_at: "2000/10/10", publisher: "本の雑誌社", original_price: 1800 },
  { name: "だるまちゃんとかみなりちゃん", author: "かこさとし", published_at: "2000/10/10", publisher: "本の雑誌社", original_price: 1800 },
  { name: "だるまちゃんとてんぐちゃん", author: "かこさとし", published_at: "2000/10/10", publisher: "本の雑誌社", original_price: 1800 },
  { name: "だるまちゃんとうんこちゃん", author: "かこさとし", published_at: "2000/10/10", publisher: "本の雑誌社", original_price: 1800 },
  { name: "だるまちゃんとおにちゃん", author: "かこさとし", published_at: "2000/10/10", publisher: "本の雑誌社", original_price: 1800 }
])

puts "done!"
