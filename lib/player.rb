require './lib/card'
require './lib/deck'

class Player
  attr_reader :name, :deck, :cards
  def initialize(name, deck)
    @name = name
    @deck = deck
    #@cards = cards
  end

  def has_lost?
    #if (@deck.cards.count) == 0
    @deck.cards.count <= 2
    #   return true
    # else
    #   return false
  end
end
