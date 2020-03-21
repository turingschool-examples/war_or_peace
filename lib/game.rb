class Game
  def initialize
  end

  def start(player1, player2)
    p "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are #{player1.name} and #{player2.name}. Type 'GO' to start the game!"

    reply = gets.upcase
    unless reply = "GO"
      puts "Type 'GO' to start the game!"
    end
  end
end
