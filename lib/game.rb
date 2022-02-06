require 'pry'

class Game

  def initialize(player1, player2)
   @player1 = player1
   @player2 = player2
   @turn = Turn.new(@player1, @player2)
  end

  def start_game
    puts "Turn 1: #{@turn.winner.name} won 2 cards"




    # if turn.counter < 10000000
    #
    # Turn.new
    # else
    #   puts "1M turns reached. It's a draw."
    # end
  end
end
