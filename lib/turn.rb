require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
#
# def type
#   @basic = basic
#   @war = war
#   @mutually_assured_destruction = mutually_assured_destruction
# end
#
# def basic?
#   if player1.deck(0) != player2.deck(0)
#     true
#   end
end
