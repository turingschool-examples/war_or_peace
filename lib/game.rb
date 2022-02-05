require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :cards, :deck, :player, :turn, :start
  def start(player1, player2, deck, turn)
    @deck = deck
    @cards = cards
    @turn = turn 
  end
end
