require 'pry'
require 'active_record'
require_relative 'lib/contact'
#require_relative './contact_list'

# Output messages from Active Record to standard out
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'w3d3',
  username: 'development',
  password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)
puts 'CONNECTED'

puts 'Setting up Database (recreating tables) ...'

# Use this once
# ActiveRecord::Schema.define do
#   drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
#   create_table :contacts do |t|
#     t.column :name, :string
#     t.column :email, :string
#     t.timestamps null: false
#   end
# end



puts 'Setup DONE'

# Create example data
# Do it once
def populate
  require 'faker'

  10.times do
    Contact.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
    )
  end

end

#populate
