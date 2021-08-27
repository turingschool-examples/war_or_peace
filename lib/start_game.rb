class StartGame
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    winner = @player1
    turn_num = 1
    while turn_num <= 100 do
      turn = Turn.new(@player1, @player2)

      turn.pile_cards

      winner = turn.winner

      turn.award_spoils(winner)

      
      turn_num += 1
    end
    p "*~*~*~* #{winner} has won the game! *~*~*~*"
  end
end
