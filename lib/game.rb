class Game
  attr_reader :turn
  def initialize(turn)
    @turn = turn
end

def start
  p "Welcome to War! (or Peace) This game will be played with 52 cards."
  p "The players today are Megan and Aurora."
  p "Type 'GO' to start the game!"
  p "------------------------------------------------------------------"
end
