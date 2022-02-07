
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_accessor :count

  def initialize
    @count = 0
  end

  def start(turn)
    until @count == 10000
      @count += 1
      turn_type = turn.type

      #turn.pile_cards
    #  if turn.player1.has_lost?
    #    puts "*~*~*~* #{turn.player2.name} has won the game! *~*~*~"
    #  elsif turn.player2.has_lost?
    #    puts "*~*~*~* #{turn.player1.name} has won the game! *~*~*~"
    #  else
        #winner = turn.winner
        if turn_type == :basic
          winner = turn.winner
          turn.pile_cards
          turn.award_spoils(winner)
          puts "Turn #{count}: #{winner.name} won 2 cards"

        elsif turn_type == :war
          winner = turn.winner
          turn.pile_cards
          turn.award_spoils(winner)
          puts "Turn #{count}: WAR - #{winner.name} won 6 cards"

        else
          turn.pile_cards
          puts "Turn #{count}: * mutually assured destruction * 6 cards removed from play"

        end
        break if turn.player1.has_lost? || turn.player2.has_lost?

        if turn.player1.has_lost?
          puts "*~*~*~* #{turn.player2.name} has won the game! *~*~*~"
        elsif turn.player2.has_lost?
          puts "*~*~*~* #{turn.player1.name} has won the game! *~*~*~"
        elsif count == 10000
          puts "---- DRAW ----"
        #@count += 1
        #turn = Turn.new(turn.player1, turn.player2)
      #start(Turn.new(turn.player1, turn.player2))
        end
    end
    if turn.player1.has_lost?
      puts "*~*~*~* #{turn.player2.name} has won the game! *~*~*~"
    elsif turn.player2.has_lost?
      puts "*~*~*~* #{turn.player1.name} has won the game! *~*~*~"
    else
    end
  end
    #return puts "---- DRAW ----" if @count > 10000
end
