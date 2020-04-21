class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    highs = cards.select do |card|
      card if card.rank >= 11
    end
  end

  def percent_high_ranking
    percent = high_ranking_cards.length / cards.length.to_f * 100
    percent.round(2)
  end

  def remove_card
    @cards.shift
  end

end
