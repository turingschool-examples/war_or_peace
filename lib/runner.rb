require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'turn'
require_relative 'create_deck'
require_relative 'start'







p "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"

# gets.chomp.upcase
# if gets.chomp.upcase == "GO"
#
# game = Start.start


require 'pry'; binding.pry

p 'test'





# iteration 1 below
# card1 = Card.new(:diamond, 'Queen', 12)
# card2 = Card.new(:spade, '3', 3)
# card3 = Card.new(:heart, 'Ace', 14)
#
# cards = [card1, card2, card3]
#
# deck = Deck.new(cards)
# card4 = Card.new(:club, '5', 5)

# deck.add_card(card4)
#iteration 2 part 1 below

# card1 = Card.new(:diamond, 'Queen', 12)
# card2 = Card.new(:spade, '3', 3)
# card3 = Card.new(:heart, 'Ace', 14)
#
# cards = [card1, card2, card3]
# deck = Deck.new(cards)
# player = Player.new('Clarisa', deck)
# player.name
#
# player.deck
#iteration 2 part 2.1 below

# card1 = Card.new(:heart, 'Jack', 11)
# card2 = Card.new(:heart, '10', 10)
# card3 = Card.new(:heart, '9', 9)
# card4 = Card.new(:diamond, 'Jack', 11)
# card5 = Card.new(:heart, '8', 8)
# card6 = Card.new(:diamond, 'Queen', 12)
# card7 = Card.new(:heart, '3', 3)
# card8 = Card.new(:diamond, '2', 2)
#
# deck1 = Deck.new([card1, card2, card5, card8])
# deck2 = Deck.new([card3, card4, card6, card7])
#
# player1 = Player.new("Megan", deck1)
# player2 = Player.new("Aurora", deck2)
#
# turn = Turn.new(player1, player2)
#
# turn.player1
# turn.player2
# turn.spoils_of_war
# turn.type
# winner = turn.winner
# # turn.pile_cards
# # turn.spoils_of_war
#
# require 'pry'; binding.pry
#
# p "fml"
