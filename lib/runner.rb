require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'


card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
card4 = Card.new(:diamond, 'Queen', 12)
card5 = Card.new(:spade, '3', 3)
card6 = Card.new(:heart, 'Ace', 14)
cards = [card1, card2, card3, card4, card5, card6]

deck1 = Deck.new([card1, card2, card3])
deck2 = Deck.new([card4, card5, card6])
# deck1.cards
# deck2.cards
# deck.rank_of_card_at(0)
# deck.rank_of_card_at(2)
# deck.cards
# deck.high_ranking_cards
# deck.percent_high_ranking
# # deck.remove_card
# deck.cards
# deck.high_ranking_cards
# deck.percent_high_ranking
# card4 = Card.new(:club, '5', 5)
# deck.add_card(card4)
# deck.cards
# deck.high_ranking_cards
# deck.percent_high_ranking

player1 = Player.new("Jack", deck1)
player2 = Player.new("John", deck2)
player1.has_lost?
player2.has_lost?

turn = Turn.new(player1, player2)


# require 'pry'; binding.pry
