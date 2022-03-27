require '.lib/turn'
class Game
  attr_reader :deck 
  def initialize

  end

  def start
    p "Welcome to War! (or peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
    p "_" * 10
  end

end
