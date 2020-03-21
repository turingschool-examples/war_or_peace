class Game
  def initialize
    @turns = 0
  end


  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are #{player1.name} and #{player2.name}.
    Type 'GO' to start the game!
    ________________________________________________________________"

    if gets == "go"
      puts "Here we go!"
    end
  end
end
