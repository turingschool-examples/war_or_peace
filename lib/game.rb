require "pry"

class Game
  # attr_reader :turn, :player1, :player2
  #
  # def intialize(turn)
  #   @turn = turn
  #   @player1 = player1
  #   @player2 = player2
  # end

  def start
    p "Welcome, to the game"
    p "Type GO to start"
    user_input = gets.chomp
    if user_input == "GO"
      until @all_cards == [] do
        @turn = Turn.new(player1, player2)
      end
    else
      p 'Please enter GO'
    end
  end
end
