class Player
  require 'rspec'
  require './lib/deck'
  require './lib/card'


  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    return deck.cards.count <= 0
  end

end
