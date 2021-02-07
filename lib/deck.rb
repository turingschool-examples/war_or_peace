class Deck
  attr_reader :cards, :high_rank

  def initialize(cards)
    @cards = cards
    @high_rank = []
  end

  def rank_of_card_at(position)
    return 0 unless cards[position]
    cards[position].rank
  end

  def high_ranking_cards
    high_rank = cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking_cards
    percent = (high_ranking_cards.count.to_f / cards.count.to_f) * 100
    percent.round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards << card
  end
end
