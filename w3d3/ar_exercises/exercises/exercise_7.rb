require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "\nExercise 7".blue
puts "----------\n".blue

puts "Type a store name: ".green
new_store_name = gets.chomp
store10 = Store.create(name: "#{new_store_name}")
puts store10.errors.messages

a = @store2.employees.create
puts a.errors.messages

b = @store2.employees.create(first_name: "Connie", last_name: "Cho", hourly_rate: 0)
puts b.errors.messages

c = @store2.employees.create(first_name: "Connie", last_name: "Cho", hourly_rate: 1000)
puts c.errors.messages

d = Employee.create(first_name: "Connie", last_name: "Cho", hourly_rate: 100)
puts d.errors.messages

puts "Type a store name: ".green
new_store_name = gets.chomp
store10 = Store.create(name: "#{new_store_name}", annual_revenue: -10)
puts store10.errors.messages

store10 = Store.create(name: "Banana", annual_revenue: 100000, mens_apparel: false, womens_apparel: false)
puts store10.errors.messages
