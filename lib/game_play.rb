require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class GamePlay

  #
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  #start the game and run until it is over
  def start
    result = "---- DRAW ----"
    i = 1
    #Go though up to 1000 turns
    while i < 1000
      #create a turn
      turn = Turn.new(@player1, @player2)
      #run thorugh all the methods to play a turn
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      #print the result of the turn
      if (turn.type == :basic)
        puts "Turn #{i}: #{winner.name} won 2 cards"
      elsif (turn.type == :war)
        puts "Turn #{i}: #{turn.type} - #{winner.name} won 6 cards"
      else
        puts "Turn #{i}: *mutually assured destruction* 6 cards removed from play"
      end
      #determine if someone and break out of the loop if that is the case
      if (@player1.has_lost? || @player2.has_lost?)
        result = "*~*~*~* #{winner.name} has won the game! *~*~*~*"
        break
      end
      i += 1
    end
    return result
  end

end
