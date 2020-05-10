class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @deck.cards.empty?
  end

  def hand
    @deck.cards
  end

  def short_hand?
    @deck.cards.size < 3 || @deck.cards.size == 0
  end

end
