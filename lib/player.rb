require './lib/card.rb'
require './lib/deck.rb'

class Player
  attr_accessor :deck
  attr_reader :cards, :name
  def initialize(name, deck)
    @name = name
    @deck = deck
  end
  def has_lost?
    deck.cards == []
  end
end
