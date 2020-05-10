class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    cards.select { |card| card.rank >= 11 }
  end

  def add_card(new_card)
    cards << new_card
  end

  def remove_card
    cards.shift
  end

  def percent_high_ranking
    high_cards = cards.select { |card| card.rank >= 11 }
    (100*high_cards.length.to_f / cards.length.to_f).round(2)
  end

end
