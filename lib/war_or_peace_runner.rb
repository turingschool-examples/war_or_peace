require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

cards = []
rank = 1
array_of_values = (Array.new(11) {|integer| integer.to_s} +
                  ["Jack", "Queen", "King", "Ace"])
array_of_values.shift(2)
value = array_of_values
num = -1

13.times do
  card = Card.new(:club, value[num += 1], rank += 1 )
  cards << card
end
rank = 1
num = -1
13.times do
  card = Card.new(:spade, value[num += 1], rank += 1 )
  cards << card
end
rank = 1
num = -1
13.times do
  card = Card.new(:heart, value[num += 1], rank += 1 )
  cards << card
end
rank = 1
num = -1
13.times do
  card = Card.new(:diamond, value[num += 1], rank += 1 )
  cards << card
end

left,right = cards.shuffle.each_slice( (cards.size/2.0).round ).to_a

deck1 = Deck.new(left)
deck2 = Deck.new(right)
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)
require "pry"
binding.pry

p cards
