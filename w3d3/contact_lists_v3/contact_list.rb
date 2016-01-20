require 'active_record'
require './lib/contact'
require './setup'
require 'colorize'

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
  all_contacts = Contact.all.to_a
  all_contacts.each_with_index do |info, index|
    puts "ID #{info.id}: #{info.name} \t\t#{info.email}"
  end
  puts "---"
  puts "#{all_contacts.length} records total".yellow

elsif user_in == "new"
  puts "Full name (First_name Lastname): "
  name = gets.chomp
  puts "Email address: "
  email = gets.chomp
  info = Contact.create(name: name, email: email)
  info.save
  puts "ID #{info.id}: #{info.name} \t#{info.email}".blue
  puts "The contact was created successfully.".green

elsif user_in == "show"
  puts "Enter ID number: "
  id = gets.chomp.to_i
  info = Contact.find(id)
  puts "\nID:\t#{info.id}".green
  puts "Name:\t#{info.name}".blue
  puts "Email:\t#{info.email}".blue

elsif user_in == "search"
  puts "Search: "
  term = gets.chomp
  results = Contact.where('name ~* ? OR email ~* ?', term, term)
  results.each do |row|
    puts "\nID:\t#{row.id}".green
    puts "Name:\t#{row.name}".blue
    puts "Email:\t#{row.email}".blue
  end
  puts "---"
  puts "#{results.length} records total".yellow

elsif user_in == "update"
  puts "Enter ID: "
  id = gets.chomp.to_i
  puts "Change name: "
  new_name = gets.chomp
  puts "Change email: "
  new_email = gets.chomp
  Contact.update(id, name: new_name, email: new_email)

elsif user_in == "destroy"
  puts "Enter ID: "
  id = gets.chomp
  the_contact = Contact.find(id)
  the_contact.destroy   

end
