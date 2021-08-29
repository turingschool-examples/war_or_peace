class Game
  attr_reader   :player1,
                :player2


  def initialize(player1, player2)
    @player1  = player1
    @player2  = player2

  end

  def start
    p "Welcome to War (or Peace)!  This game will be played with 52 cards.
          The players today are Megan and Aurora.
          Type 'Go' to start the game."


  end

  def shuffle

  end

end
