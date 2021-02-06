require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class War
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    # require "pry"; binding.pry
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{turn.player1.name} and #{turn.player2.name}."
    p "Type 'GO' to start the game!"
  end

end
