require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/game'

deck1 = []
deck2 = []
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)
turn_number = 0

p "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are Megan and Aurora. Type 'GO' to start the game!"
game.trigger


if player1.has_lost? == false && player2.has_lost? == false
  Turn.new(player1, player2)
  if turn.type == :basic
    turn_number += 1
    turn.pile_cards
    turn.award_spoils(winner)
    p "Turn #{turn_number}: #{winner.name} won 2 cards"

  elsif turn.type == :war
    turn_number += 1
    turn.pile_cards
    turn.award_spoils(winner)
    p "Turn #{turn_number}: WAR - #{winner.name} won 6 cards"

  elsif type == :mutually_assured_destruction
    turn_number += 1
    turn.pile_cards
    p "Turn #{turn_number}: *mutually assured destruction* 6 cards removed from play"
  end
end

if player1.has_lost? == true
  p "*~*~*~* Aurora has won the game! *~*~*~*"
elsif player2.has_lost? == true
  p "*~*~*~* Megan has won the game! *~*~*~*"
end
