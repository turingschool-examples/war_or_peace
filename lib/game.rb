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

  def round
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
  end

  def start
    round
  end

end
