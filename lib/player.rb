require './lib/card'
require './lib/deck'

class Player

  attr_reader :name, :deck

  #Initialize takes a string and a deck argument
  def initialize(name, deck)
    @name = name
    @deck = deck
  end



end
