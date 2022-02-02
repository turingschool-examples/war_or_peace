require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
card4 = Card.new(:club, 'Jack', 11)
cards = [card1, card2]
deck1 = Deck.new([card1, card2])
deck2 = Deck.new([card3, card4])

#high_cards = deck.high_ranking_cards
#index = deck.rank_of_card_at(0)

player1 = Player.new('John',deck1)
player2 = Player.new('Paul',deck2)

turn1 = Turn.new(player1, player2)
pry.binding
#puts index
#deck.percent_high_ranking
#deck.add_card(card4)
