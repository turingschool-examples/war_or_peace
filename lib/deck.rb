class Deck
attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(element_of_cards)
    @cards[element_of_cards].rank
  end

  def high_ranking_cards
    @cards.select { |card| card.rank >= 11 }
  end

  def percent_high_ranking

  end

end