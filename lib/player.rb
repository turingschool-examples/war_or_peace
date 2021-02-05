class Player
  attr_reader :deck,
              :name

  def initialize(name, deck)
    @deck = deck
    @name = name
  end

  def has_lost?
    deck.cards.size == 0
  end

  def lose_card
    deck.remove_card
  end

end
