require './lib/card'
require './lib/deck'
require './lib/player'
require  './lib/turn'



suit = [:hearts, :spades, :diamonds, :clubs]
value = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
"Ten", "Jack", "Queen", "King", "Ace"]
rank = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

group = suit.flat_map {|suit| value.flat_map {|value| rank.flat_map { |rank| Card.new(suit, value, rank)}}}

require "pry"; binding.pry

p

deck = Deck.new(cards)
