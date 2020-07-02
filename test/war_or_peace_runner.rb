require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require "pry"

def create_deck
  10.times do
    rank = 1
    value = rank.to_s
    Card.new(:heart, value, rank)
    rank += 1
  end
  Card.new(:heart, "Jack", 12)
  Card.new(:heart, "Queen", 13)
  Card.new(:heart, "King", 13)
  Card.new(:heart, "Ace", 14)

  10.times do
    rank = 1
    value = rank.to_s
    Card.new(:spades, value, rank)
    rank += 1
  end
  Card.new(:spades, "Jack", 12)
  Card.new(:spades, "Queen", 13)
  Card.new(:spades, "King", 13)
  Card.new(:spades, "Ace", 14)


  10.times do
    rank = 1
    value = rank.to_s
    Card.new(:diamond, value, rank)
    rank += 1
  end
  Card.new(:diamond, "Jack", 12)
  Card.new(:diamond, "Queen", 13)
  Card.new(:diamond, "King", 13)
  Card.new(:diamond, "Ace", 14)

def create_diamonds
  10.times do
    rank = 1
    value = rank.to_s
    Card.new(:clubs, value, rank)
    rank += 1
  end
  Card.new(:clubs, "Jack", 12)
  Card.new(:clubs, "Queen", 13)
  Card.new(:clubs, "King", 13)
  Card.new(:clubs, "Ace", 14)
end

def start
end
