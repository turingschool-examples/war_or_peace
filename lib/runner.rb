require './lib/card.rb'
require './lib/deck.rb'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
card4 = Card.new(:spade, 'Ace', 14)
card5 = Card.new(:heart, '2', 2)
cards = cards = [card1, card2, card3, card4, card5]

deck = Deck.new(cards)
deck.cards
deck.rank_of_card_at(0)
deck.rank_of_card_at(2)
deck.cards
deck.high_ranking_cards
# require 'pry'; binding.pry
