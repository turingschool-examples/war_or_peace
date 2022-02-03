require_relative 'card'
require_relative 'deck'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)

cards = [card1, card2, card3]

deck = Deck.new(cards)
# card4 = Card.new(:club, '5', 5)
#
# deck.add_card(card4)
#
require 'pry'; binding.pry
# p deck.rank_of_card_at(2)
p "fml"
# p deck.cards
# p card1
# p cards
