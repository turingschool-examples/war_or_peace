class Player
  attr_reader :deck,
              :name

  def initialize(name, deck)
    @deck = deck
    @name = name
  end

  def has_lost?
    deck.cards.count == 0
  end
end
