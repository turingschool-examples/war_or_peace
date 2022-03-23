require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start; end
end
