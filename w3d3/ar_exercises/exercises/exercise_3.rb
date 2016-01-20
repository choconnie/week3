require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'

puts "\nExercise 3"
puts "----------\n"

# Your code goes here ...
@store3 = Store.find(3)
@store3.destroy

puts "How many stores?".red
puts Store.count
