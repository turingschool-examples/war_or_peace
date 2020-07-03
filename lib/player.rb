class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @deck.cards.empty?

  end

#recommitting to master instead of main since it's messing things up
# :(

end # this is the end of the class!!!
