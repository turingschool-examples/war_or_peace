require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'

class Turn

attr_accessor :deck1, :deck2
attr_reader :player1, :player2

def initialize(player1, player2)
  @player1 = player1
  @player2 = player2
end

end
