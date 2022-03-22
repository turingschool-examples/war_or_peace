class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.select { |card| card.rank >= 11 }
  end

  def percent_high_ranking
    (high_ranking_cards.length.to_f / @cards.length) * 100
  end

  def remove_card
    @cards.shift
  end
end
