class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.select do |card|
        card.rank >= 11
    end
  end

  def percent_high_ranking
    high_cards = high_ranking_cards
    high_cards.size.to_f / @cards.size
  end
end
