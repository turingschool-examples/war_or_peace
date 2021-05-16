class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = "Clarissa"
    @deck = deck
  end

  def has_lost?
    if player.deck == []
      return true
    else
      return false
    end
  end
end
