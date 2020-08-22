require "pry"

class Game
  attr_reader :turn, :player1, :player2

  def intialize(turn)
    @turn = turn
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome, to the game"
    p "Type GO to start"
    user_input = gets.chomp.upcase
    if user_input == "GO"
    else
      p 'That was not Go. '
    end
      until @cards == [] do
        @turn = Turn.new(player1, player2)
      end
    end

end
