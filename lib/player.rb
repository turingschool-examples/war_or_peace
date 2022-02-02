class Player
  attr_reader :name, :deck
  def initialize(name, deck = [])
    @name = name
    @deck = deck
  end
  def has_lost?
    deck.length()>=1
    #^^^^^ WE ARE HERE ^^^^^^
  end
end
