class Deck
  attr_reader :cards
  def initialize(cards)
    # @rank = rank
    # @suit = suit
    # @value = value
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.rank
  end

end
