require 'pry'

class Game

  def initialize(player1, player2)
   @player1 = player1
   @player2 = player2
   @turn = Turn.new(@player1, @player2)
  end

  def start_game(x)
    @turn.type
    @turn.winner
    @turn.pile_cards
    spoils = @turn.spoils_of_war.count
    winner = @turn.winner
    @turn.award_spoils(winner)
    puts "Turn #{x}: #{@turn.winner.name} won #{spoils} cards"
  end

  def play_game
    1000000.times do |turn_num|
      start_game(turn_num)
        # break if turn_num > 1000000
      puts turn_num
    end
  end
end
