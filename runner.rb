require 'pry'
require './lib/card.rb'
require './lib/deck.rb'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
card4 = Card.new(:club, '5', 5)
cards = [card1, card2, card3]
deck = Deck.new(cards)

binding.pry
