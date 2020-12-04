require 'pry'

class Player
  attr_reader :name
  attr_accessor :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @deck.cards.length == 0
  end
end
