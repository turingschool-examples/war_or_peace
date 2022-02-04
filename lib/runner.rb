 #require_relative 'card'
# #require './lib/deck'
 require_relative 'deck'
require_relative 'player'
card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)

cards = [card1, card2, card3]

deck = Deck.new(cards)
#
# deck.cards
# deck.rank_of_card_at(0)
# deck.rank_of_card_at(2)
# deck.cards
# deck.high_ranking_cards
# deck.percent_high_ranking
#
# require 'pry'; binding.pry
player = Player.new('Clarisa', deck)

player.name
