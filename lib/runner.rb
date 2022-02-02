require './lib/card'
require './lib/deck'

card1 = Card.new(:diamond, 'Queen', 12)

card2 = Card.new(:spade, '3', 3)

card3 = Card.new(:heart, 'Ace', 14)

cards = [card1, card2, card3]

deck = Deck.new(cards)

puts "-----------------"
puts "deck"
puts deck.cards

puts "-----------------"
puts "rank of card at 0"
puts deck.rank_of_card_at(0)

puts "-----------------"
puts "rank of card at 2"
puts deck.rank_of_card_at(2)

# puts "-----------------"
# puts "high ranking cards"
# puts deck.high_ranking_cards
