class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p"Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"

    input = gets.chomp.upcase

    until input == 'GO'
      p "Error! Invalid input. Please try again."
      input = gets.chomp.upcase
    end
    play_turns
  end
end
