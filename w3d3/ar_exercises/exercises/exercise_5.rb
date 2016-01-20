require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "\nExercise 5".blue
puts "----------\n".blue

# Your code goes here ...
puts "Sum of annual_revenue".yellow
puts sum = Store.sum(:annual_revenue)
puts "Average of annual_revenue".yellow
puts avg = sum / Store.count
puts "Number of stores ( > $1M in annual sales )".yellow
puts Store.where("annual_revenue > ?", 1000000).count
