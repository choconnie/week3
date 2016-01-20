require_relative 'contact'
require 'csv'
#require 'pg'
require 'colorize'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  puts "\nHere is a list of available commands:"
  puts "    new     - Create a new contact"
  puts "    list    - List all contacts"
  puts "    show    - Show a contact"
  puts "    search  - Search contacts"
  puts "    update  - Update contacts"
  puts "    destroy - Delete contacts\n\n"
  user_in = gets.chomp.downcase
  puts "\n"

  if user_in == "list"
    Contact.all
  elsif user_in == "new"
    puts "Full name (First_name Lastname): "
    name = gets.chomp
    puts "Email address: "
    email = gets.chomp
    info = Contact.new(name, email)
    info.save
    Contact.create(name, email)
  elsif user_in == "show"
    puts "Enter ID number: "
    id = gets.chomp.to_i
    Contact.find(id)
  elsif user_in == "search"
    puts "Search: "
    term = gets.chomp
    Contact.search(term)
  elsif user_in == "update"
    puts "Enter ID: "
    id = gets.chomp.to_i

    the_contact = Contact.find(id)
    puts "Change name: "
    new_name = gets.chomp
    puts "Change email: "
    new_email = gets.chomp
    puts new_name.is_a? Array
    the_contact.name = new_name
    the_contact.email = new_email
    the_contact.id = id
    the_contact.change = true
    the_contact.save
  elsif user_in == "destroy"
    puts "Enter ID: "
    id = gets.chomp
    the_contact = Contact.find(id)
    the_contact.id = id
    the_contact.destroy   
  end

end

#ContactList(ARGV)