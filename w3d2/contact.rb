require 'csv'
require 'colorize'

# Represents a person in an address book.
class Contact

  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: Assign parameter values to instance variables.
    @name = name
    @email = email
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      arr = CSV.read('contacts.csv')
      arr.each_with_index do |contact, index|
        puts "ID #{index+1}: #{contact.join(" ")}"
      end
      puts "---"
      puts "#{arr.length} records total".yellow
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      CSV.open('contacts.csv', 'a') << [name, email]
      id = `wc -l #{'./contacts.csv'}`.to_i
      puts "ID #{id+1}: #{name} #{email}"
      puts "The contact was created successfully."
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      arr = CSV.read('contacts.csv')
      arr.each_with_index do |contact, index|
        if index == id-1
          puts "ID:    #{id}"
          puts "Name:  #{contact[0]}"
          puts "Email: #{contact[1]}"
        elsif id <= 0 || id > arr.length
          return puts "Not found".red
        end
      end
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      info =[]
      info = `grep -n #{term} #{'./contacts.csv'}`
      puts info
      puts "---"
      puts "#{info[0]} records total".yellow
    end

  end

end