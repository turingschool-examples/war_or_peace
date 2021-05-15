require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def basic
  end

  def war
  end

  def mutually_assured_destruction
  end

  def type
     if @player1.rank_of_card_at(0) != @player2.rank_of_card_at(0)
       @basic
     else @player1.rank_of_card_at(0) == @player2.rank_of_card_at(0)
       @war
     end
   end

end
