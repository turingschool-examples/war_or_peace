class Turn
  attr_reader :player1, :player2

  def initialize(player1_obj, player2_obj)
    @player1 = player1_obj
    @player2 = player2_obj
  end
end