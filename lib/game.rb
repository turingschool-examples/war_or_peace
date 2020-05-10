class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    l1 = "Welcome to War! (or Peace). This game will be played with 52 cards."
    l2 = "The players today are #{@turn.player1.name} and #{@turn.player2.name}."
    l3 = "Type 'GO' to start the game!"
    l4 = "------------------------------------------------------------------"
    welcome_message = "#{l1} \n" + "#{l2} \n" + "#{l3} \n" + "#{l4}"
    p welcome_message
  end
end
