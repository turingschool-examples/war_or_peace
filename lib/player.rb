require 'pry'
require './lib/card'
require './lib/deck'

class Player
  attr_reader :deck,
              :name

  def initialize(name, deck)
    # binding.pry
    @name = name
    @deck = deck
  end

  def has_lost?
    # binding.pry
    deck.cards.length == 0
  end
end
