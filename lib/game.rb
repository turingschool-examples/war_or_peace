
class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1  = player1
    @player2  = player2
  end

  def start
    puts welcome
    puts user_input
  end


  def start_game
    p "Hello!"
    turn_count = 0
    while turn_count < 1000000
      turn = Turn.new(player1, player2)
      # require "pry"; binding.pry
      turn_count += 1
      p turn_count
      p turn.type
    end
  end

  def user_input
    input = gets.chomp
    if input.upcase == "GO"
      start_game
    elsif input.upcase != "GO"
      puts "Maybe next time"
      exit
    end
  end

  def welcome
    "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Megan and Aurora.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
  end

end
