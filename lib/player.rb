class Player
  attr_reader :name, :deck

  def initialize(n, d)
    @name = n
    @deck = d
  end

  def num_cards
    deck.cards.size
  end

  def has_lost?
    num_cards.zero?
  end

  def card_rank_at(index)
    deck.rank_of_card_at(index)
  end
end
