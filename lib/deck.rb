class Deck
  attr_reader :cards
  def initialize (cards)
    @cards = cards
  end

  def rank_of_card_at (index)
    cards[index].rank
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank > 9
        high_cards << card
      end
    end
    return high_cards
  end

  def percent_high_ranking
    high_cards = []
    low_cards = []
    cards.each do |card|
      if card.rank > 9
        high_cards << card
      else
        low_cards << card
      end
    end
    return ((high_cards.count.to_f / cards.count.to_f) * 100).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(addition)
    cards << addition
  end

end
