class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = "Clarissa"
    @deck = deck
  end

  def has_lost?
    player.deck == []
  end
end
