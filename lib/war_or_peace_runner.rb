require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
#welcome to the game

#create decks and shuffle them
deck1 = Deck.new
deck2 = Deck.new
deck1.new_deck
deck2.new_deck

#create players
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)
turn = Turn.new(player1, player2)
#start game
new_game = Game.new(turn)
new_game.start

# turn = Turn.new(player1, player2)
# count = 0
# while count < 10 do
#   count += 1
#     turn.type
#
#     if turn.type == :war
#       p "Turn #{count}: WAR - #{turn.winner.name} won 6 cards"
#       turn.pile_cards
#       # turn.award_spoils(turn.winner)
#     elsif turn.type == :basic
#         p "Turn #{count}: #{turn.winner.name} won 2 cards"
#         turn.pile_cards
#
#       elsif turn.type == :mutually_assured_destruction
#         p "Turn #{count} *mutually assured destruction* 6 cards removed from play"
#         # turn.award_spoils(turn.winner)
#         # require "pry"; binding.pry
#     end
#
#     # break if player1.has_lost? || player2.has_lost?
#     # require "pry"; binding.pry
#   end
