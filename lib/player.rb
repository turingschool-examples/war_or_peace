class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end 

  def has_lost?
    has_lost = false
  end 
end 