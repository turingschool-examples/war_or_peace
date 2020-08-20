class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

  end

  def welcome_message
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.\n
    The players today are #{@player1.name} and #{@player2.name}.\n
    Type 'GO' to start the game!\n
    ------------------------------------------------------------------"
  end
  def start
    # require "pry"; binding.pry
    welcome_message
    print "--->  "
    start = gets.chomp.upcase
  end


end
