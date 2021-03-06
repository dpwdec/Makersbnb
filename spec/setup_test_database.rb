require 'pg'
require 'bcrypt'

def setup_test_database
  connection = PG.connect(dbname: 'spaced_out_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE bookings, users, spaces;")
  connection.exec("INSERT INTO spaces (id, name, description, price, available_from, available_to, user_id) VALUES (1, 'Mars', 'BEST PLANET TO LIVE', '1000', '2020-10-10', '2020-10-12', 1);")
  connection.exec("INSERT INTO spaces (id, name, description, price, available_from, available_to, user_id) VALUES (2, 'Pluto', 'WORST PLANET TO LIVE', '1200', '2030-10-10', '2040-10-12', 1);")
  connection.exec("INSERT INTO users (id, username, name, email, password) VALUES (1, 'Joe1984', 'Joe Bloggs', 'joebloggs@hotmail.com', '#{BCrypt::Password.create('12345')}');")
end
