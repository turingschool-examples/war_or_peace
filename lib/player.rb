class Player
  attr_reader :name, :deck

  def initialize(n, d)
    @name = n
    @deck = d
  end

  def has_lost?
    deck.cards.size == 0
  end

  def card_rank_at(index)
    deck.rank_of_card_at(index)
  end
end
