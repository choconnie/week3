require 'csv'
require 'pg'
require 'colorize'

# Represents a person in an address book.
class Contact

  attr_accessor :name, :email, :id
  attr_writer :change

  def initialize(name, email, id=nil)
    # TODO: Assign parameter values to instance variables.
    @name = name
    @email = email
    @id = id
    @change = false
  end


  def self.connection
    @@connection ||= PG.connect( dbname: 'postgres' )
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      info_results = []
      results = connection.exec("SELECT * FROM contacts;")
      results.each do |row|
        each_info = Contact.new(row['name'], row['email'], row['id'])
        puts "ID #{row['id']}: #{row['name']} #{row['email']}".green
        info_results.push(each_info)
      end
      puts "---"
      puts "#{info_results.length} records total".yellow
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      results = connection.exec("SELECT * FROM contacts ORDER BY id DESC LIMIT 1;")
      results.each do |row|
        each_info = Contact.new(row['name'], row['email'], row['id'])
        puts "ID #{row['id']}: #{row['name']} #{row['email']}".blue
      end
      puts "The contact was created successfully.".green
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      each_info = []
      results = connection.exec_params("SELECT * FROM contacts WHERE id = $1::int;", [id])
      results.each do |row|
         each_info = Contact.new(row['name'], row['email'], row['id'])
        puts "\nID:\t#{row['id']}".green
        puts "Name:\t#{row['name']}".blue
        puts "Email:\t#{row['email']}".blue
      end
      puts each_info
      each_info
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      count = 0
      results = connection.exec_params("SELECT * FROM contacts WHERE name LIKE ('%'||$1||'%') OR email LIKE ('%'||$1||'%');", [term])
      results.each do |row|
        each_info = Contact.new(row['name'], row['email'], row['id'])
        puts "\nID:\t#{row['id']}".green
        puts "Name:\t#{row['name']}".blue
        puts "Email:\t#{row['email']}".blue
        count += 1
      end
      puts "---"
      puts "#{count} records total".yellow
    end

  end

  def save
    id = self.id.to_i
    if @change == false
      new_info = self.class.connection.exec_params("INSERT INTO contacts (name, email) VALUES ($1, $2);", [self.name, self.email])
    else
      name = self.name.to_s
      email = self.email.to_s
      new_info = self.class.connection.exec_params("UPDATE contacts SET name = $1, email = $2 WHERE id = $3::int;", [name, email, id])
    end
  end

  def destroy
    self.class.connection.exec_params("DELETE FROM contacts WHERE id = $1::int;", [self.id])
  end

end