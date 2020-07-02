class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(cards_index)
    @cards.fetch(cards_index).rank
  end

  def high_ranking_cards
    cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    (high_ranking_cards.length.to_f / cards.length.to_f).round(4) * 100.0
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards << card
  end

end
