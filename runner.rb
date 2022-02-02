require 'pry'
require './lib/card'
require './lib/deck'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
card4 = Card.new(:club, 'Jack', 11)
cards = [card1, card2, card3, card4]
deck = Deck.new(cards)
high_cards = deck.high_ranking_cards
pry.binding
