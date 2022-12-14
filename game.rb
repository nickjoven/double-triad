# Game has players
# Players have a deck (a deck is an array of cards)
# Cards have stats

require 'securerandom'
require 'sqlite3'

db = SQLite3::Database.new("game.db")

# Create a table
rows = db.execute <<-SQL
  create table players (
    id PRIMARY KEY,
    name varchar(255),
    email varchar(255),
    password varchar(255)
  );
SQL

rows = db.execute <<-SQL
  create table cards(
    id PRIMARY KEY,
    name varchar(255),
    top int,
    left int,
    bottom int,
    right int,
    element varchar(255),
    img varchar(255),
    card_id varchar(255),
    player_id int
  );
SQL


class Player
    attr_accessor :name, :email, :password, :deck
    def initialize(name, email, password, deck = [])
        @name = name
        @email = email
        @password = password
        @deck = deck
    end
end

# In order to save this information, we would need to create a Cards table in a database
# When we create a card, we would store that card object in the database
class Card
    attr_accessor :name, :top, :left, :bottom, :right, :element, :img
    def initialize(name, top, left, bottom, right, element = nil, img = nil)
        @name = name
        @top = top
        @left = left
        @bottom = bottom
        @right = right
        @element = element
        @img = img
        @card_id = SecureRandom.uuid
    end
end