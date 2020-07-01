require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/turn'

class WarOrPeaceGame
  attr_accessor :turn_number

  @turn_number = 1

  def initialize
    Turn.new(player1, player2)
  end
end
