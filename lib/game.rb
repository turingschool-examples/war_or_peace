require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


class Game
  attr_reader :turn_counter
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_counter = 0
  end

  def start
  end

  def turns
  end
end
