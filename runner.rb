require './lib/card.rb'
require './lib/deck.rb'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)

cards = [card1, card2, card3]

deck = Deck.new(cards)



# p deck.rank_of_card_at(2)

p deck.cards
