class Turn
  attr_reader :deck,
              :player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
end
