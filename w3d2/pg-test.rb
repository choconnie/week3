require 'pg'

puts 'Connecting to the database...'
conn = PG.connect(
  host: 'localhost',
  dbname: 'bookstore',
  user: 'development',
  password: 'development'
)

puts 'Finding authors...'
conn.exec('SELECT * FROM authors;') do |results|
  # results is a collection (array) fo records (hashes)
  results.each do |author|
    puts author.inspect
  end
end

puts 'Closing the conniection...'
conn.close

puts 'DONE'
