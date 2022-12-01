###################
# Card Interaction Pattern
###################

# require './lib/card'

# p card = Card.new(:heart, 'Jack', 11)
# puts

# p card.suit
# puts

# p card.value
# puts

# p card.rank
# puts


###################
# Deck Interaction Pattern
###################


# require './lib/card'
# require './lib/deck'

# card1 = Card.new(:diamond, 'Queen', 12)
# puts card1

# card2 = Card.new(:spade, '3', 3)
# puts card2

# card3 = Card.new(:heart, 'Ace', 14) 
# puts card3
# puts

# cards = [card1, card2, card3]

# p deck = Deck.new(cards)
# puts

# p deck.cards
# puts

# p deck.rank_of_card_at(0)
# puts

# p deck.rank_of_card_at(2)
# puts

# p deck.cards
# puts

# p deck.high_ranking_cards
# puts

# p deck.percent_high_ranking
# puts

# p deck.remove_card
# puts

# p deck.cards
# puts

# p deck.high_ranking_cards
# puts

# p deck.percent_high_ranking
# puts

# p card4 = Card.new(:club, '5', 5)
# puts

# deck.add_card(card4)
# p deck.cards
# puts

# p deck.high_ranking_cards
# puts

# p deck.percent_high_ranking
# puts