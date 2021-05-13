class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @index = index
    @cards[index][3]
  end

  def high_ranking_cards
    @card.rank > 11
  end

end
