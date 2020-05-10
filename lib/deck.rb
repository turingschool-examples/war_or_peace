class Deck

  attr_reader :cards, :removed_cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    select_high_ranking
  end

  def add_card(new_card)
    cards << new_card
  end

  def remove_card
    cards.shift
  end

  def percent_high_ranking
    (100*select_high_ranking.length.to_f / cards.length.to_f).round(2)
  end

  private
  def select_high_ranking
    cards.select { |card| card.rank >= 11 }
  end

end
