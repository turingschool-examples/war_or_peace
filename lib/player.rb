require './lib/card.rb'
require './lib/deck.rb'

class Player
  attr_accessor :deck
  attr_reader :cards
  def initialize(name, deck)
    @name = name
    @deck = deck
  end
end
