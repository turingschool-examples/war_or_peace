class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are #{@player1.name} and #{@player2.name}.
    Type 'GO' to start the game!"
  end
  
end
