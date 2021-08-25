require './lib/deck'

class Player
attr_accessor :name, :deck

def initialize(name, deck)
  @name = name
  @deck = deck
end

def has_lost?
  @deck.cards.count < 0
end

end
