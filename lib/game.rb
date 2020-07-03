class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    greeting
  end
#
  def greeting
    ## start here "Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are #{@player1.name} and #{@player2.name}.\nType 'GO' to start the game!\n------------------------------------------------------------------"
  end

end
