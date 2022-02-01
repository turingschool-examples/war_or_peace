require './lib/card'
require './lib/deck'
require 'pry'

class Player
  attr_reader :name, :deck

  # def initialize(name, deck_name)
  #   @deck_name = deck_name
  #   @name = name
  def initialize(name, deck)
    @deck = deck
    @name = name
  end

  def has_lost?
    @deck.cards.count == 0
  end
end
