require './lib/card'
require './lib/deck'

class Player

  attr_accessor :name, :deck
  
  def initialize (name, deck)
    @name = name
    @deck = deck
  end
end
