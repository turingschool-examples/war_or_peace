require './lib/card'
require './lib/deck'

class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def name
    "Clarisa"
  end

  def has_lost?
    @deck.cards.any?
  end

end
