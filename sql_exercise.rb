require 'sqlite3'

if File.exists?("maindata.db")
  File.delete("maindata.db")
end

db = SQLite3::Database.new("maindata.db")

db.execute <<-SQL
create table users(
  id integer primary key,
  email varchar,
  password varchar
)
SQL

db.execute("insert into users(email) values(?)", ["bob@example.com"])
db.execute("insert into users(password) values(?)", ["passBob"])

db.execute("insert into users(email) values(?)", ["cindy@example.com"])
db.execute("insert into users(password) values(?)", ["passCindy"])

db.execute("insert into users(email) values(?)", ["piper@example.com"])
db.execute("insert into users(password) values(?)", ["passPiper"])

db.execute("insert into users(email) values(?)", ["sandra@example.com"])
db.execute("insert into users(password) values(?)", ["passSandra"])

rows = db.execute("SELECT * FROM users")
puts rows
