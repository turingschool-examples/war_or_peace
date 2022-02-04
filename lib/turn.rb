
class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize (player, player2)

    @player = player
    @player2 = player2
    @spoils_of_war = []

  end

end
