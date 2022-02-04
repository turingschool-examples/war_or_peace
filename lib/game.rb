require './card'
require './deck'
require './player'
require './turn'

class Game
    attr_reader :p1name, :p2name, :built_deck, :turn_count
    def initialize(p1name, p2name)
      @p1name = p1name
      @p2name = p2name
      @turn_count = 1
      @built_deck = []
      @player1 = nil
      @player2 = nil
      @winner = nil
    end
end