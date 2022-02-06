require 'pry'

class Game

  def initialize(player1, player2)
   @player1 = player1
   @player2 = player2
   @turn = Turn.new(@player1, @player2)
  end

  def start_game
    @turn.type
    @turn.winner
    @turn.pile_cards
    spoils = @turn.spoils_of_war.count
    winner = @turn.winner
    @turn.award_spoils(winner)
    puts "Turn 1: #{@turn.winner.name} won #{spoils} cards"




    # if turn.counter < 10000000
    #
    # Turn.new
    # else
    #   puts "1M turns reached. It's a draw."
    # end
  end
end
