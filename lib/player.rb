class Player
  attr_reader :name, :deck, :has_lost

  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end

  def has_lost?
    @has_lost = true unless deck.cards.count > 0
    return @has_lost
  end
end