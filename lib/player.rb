require './card'
require './deck'

class Player
  attr_reader :deck, :name

  def initialize(name, deck)
    @deck = deck
    @name = name
  end

  def has_lost?
    return deck.cards.length == 0
  end
end