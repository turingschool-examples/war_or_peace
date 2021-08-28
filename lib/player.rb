class Player
  attr_reader :name, # allows for reading the player name and deck
              :deck

  def initialize(name, deck) # creates a player with a name and chosen deck
    @name = name
    @deck = deck
  end

  def has_lost? # determines if a player has lost
    deck.cards == []
  end
end
