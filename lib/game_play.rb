require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class GamePlay

  #Pass in two player objects to the initialize method
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  #start the game and run until it is over
  def start
    result = "---- DRAW ----"
    i = 1
    #Go through up to one million turns
    max_turns = 1000001
    while i < max_turns
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
      #determine if a player has won and break out of the loop if that is the case
      if (@player1.has_lost? || @player2.has_lost?)
        #if both players have lost it is a draw
        if (winner == "No Winner")
          puts result
          break
        else
          result = "*~*~*~* #{winner.name} has won the game! *~*~*~*"
          puts result
          break
        end
      end
      i += 1
      #If max_turns has been reached and there is no winner output the result Draw
      if (i == max_turns)
        puts result
      end
    end
    return result
  end

end
