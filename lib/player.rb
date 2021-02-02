class Player
  attr_reader :name, :deck

  def initialize(n, d)
    @name = n
    @deck = d
  end

  def has_lost?
    return false if deck.cards.size > 0
    true
  end
end
