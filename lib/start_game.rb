class StartGame
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    turn_num = 1
    while turn_num <= 100 do
      
      turn_num += 1
    end
    p "*~*~*~* #{winner} has won the game! *~*~*~*"
  end
end
