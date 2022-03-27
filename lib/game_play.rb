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
    max_turns = 100001
    #Go though up to 1000 turns
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
        # puts("Player 1: #{@player1.deck.cards.length}")
        # puts("Player 2: #{@player2.deck.cards.length}")
      elsif (turn.type == :war)
        puts "Turn #{i}: #{turn.type} - #{winner.name} won 6 cards"
        # puts("Player 1: #{@player1.deck.cards.length}")
        # puts("Player 2: #{@player2.deck.cards.length}")
      else
        puts "Turn #{i}: *mutually assured destruction* 6 cards removed from play"
        # puts("Player 1: #{@player1.deck.cards.length}")
        # puts("Player 2: #{@player2.deck.cards.length}")
      end
      #determine if a player has won and break out of the loop if that is the case
      if (@player1.has_lost? || @player2.has_lost?)
        #if both players have lost it is a draw
        if (winner == "No Winner")#@player1.has_lost? == @player2.has_lost?)
          puts result
          break
        else
          result = "*~*~*~* #{winner.name} has won the game! *~*~*~*"
          puts result
          break
        end
      end
      i += 1
      if (i == max_turns)
        puts result
      end
    end
    return result
  end

end
