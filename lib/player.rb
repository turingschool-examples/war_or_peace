class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @deck.cards == []
  end

  def rank_of_card_at(number)
    @deck.cards[number].rank
  end

end