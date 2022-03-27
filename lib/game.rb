# require './lib/card'
# require './lib/deck'
# require './lib/player'
# require '.lib/turn'
require 'pry'

class Game
  attr_reader :player, :deck

  def initialize(player, deck)
    @player = player
    @deck = deck
  end
end
