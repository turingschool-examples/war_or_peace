class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

  end

  def game_winner
    return @player2 if @player1.has_lost?
    return @player1 if @player2.has_lost?
  end

  def game_ended
    "*~*~*~* #{game_winner.name} has won the game! *~*~*~*"
  end

  def start
    turn = Turn.new(player1, player2)
  end

end
