require './lib/card'
require './lib/deck'
require 'pry'; binding.pry
card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
cards = [card1, card2, card3]
deck = Deck.new(cards)
deck.cards
deck.rank_of_card_at(0)
deck.rank_of_card_at(2)
require 'pry'; binding.pry
