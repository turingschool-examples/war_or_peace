class Player
  attr_reader :name, :deck, :lost
  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = lost
  end

  def has_lost?
    lost = false
  end

end
