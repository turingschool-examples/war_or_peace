require "./card.rb"
require "./deck.rb"
require "./player.rb"

class Turn 
  attr_reader :player1,
              :player2,
              :spoils_of_war 

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
end 