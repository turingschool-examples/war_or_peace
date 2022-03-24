require 'pry'
require './lib/card'
require './lib/deck'

class Player
  attr_reader :cards,
              :deck,
              :name

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    deck.cards.count == 0
  end


end
