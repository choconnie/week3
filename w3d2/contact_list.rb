require_relative 'contact'
require 'csv'
require 'colorize'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  puts "\nHere is a list of available commands:"
  puts "    new     - Create a new contact"
  puts "    list    - List all contacts"
  puts "    show    - Show a contact"
  puts "    search  - Search contacts\n\n"
  user_in = gets.chomp.downcase
  puts "\n"

  if user_in == "list"
    Contact.all
  elsif user_in == "new"
    puts "Full name (First_name Lastname): "
    name = gets.chomp
    puts "Email address: "
    email = gets.chomp
    Contact.create(name, email)
  elsif user_in == "show"
    puts "Enter ID number: "
    id = gets.chomp.to_i
    Contact.find(id)
  elsif user_in == "search"
    #puts "Search: "
    #term = gets.chomp
    Contact.search(term)
  end

end

#ContactList(ARGV)