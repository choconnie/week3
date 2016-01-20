require_relative '../setup'
require 'colorize'

puts "\nExercise 1"
puts "----------\n"

# Your code goes below here ...

Store.create(name: "Burnaby", annual_revenue: 300000, mens_apparel: true, womens_apparel: true)
Store.create(name: "Richmond", annual_revenue: 1260000, mens_apparel: false, womens_apparel: true)
Store.create(name: "Gastown", annual_revenue: 190000, mens_apparel: true, womens_apparel: false)

puts "How many stores?".blue
puts Store.count
