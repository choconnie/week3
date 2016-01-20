require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "\nExercise 6".green
puts "----------\n".green

# Your code goes here ...
@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "Kevin", last_name: "Minion", hourly_rate: 100)
@store1.employees.create(first_name: "Bob", last_name: "Minion", hourly_rate: 80)
@store1.employees.create(first_name: "Stewart", last_name: "Minion", hourly_rate: 70)
@store1.employees.create(first_name: "Cash", last_name: "Money", hourly_rate: 150)

@store2.employees.create(first_name: "Olaph", last_name: "Frozen", hourly_rate: 70)
@store2.employees.create(first_name: "Anna", last_name: "Frozen", hourly_rate: 90)
@store2.employees.create(first_name: "Elsa", last_name: "Frozen", hourly_rate: 60)
