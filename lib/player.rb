class Player
  attr_accessor :name, :deck, :lost
  def initialize(name, deck, lost=false)
    @name = name
    @deck = deck
    @lost = lost
  end

  def has_lost?
    @lost = @deck.cards.length == 0
  end
end
