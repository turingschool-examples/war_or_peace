class Deck
  attr_reader :cards, :high_ranked
  def initialize(cards = [], high_ranked = [])
    @cards = cards
    @high_ranked = high_ranked
  end
  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    cards.each do |card|
      if card.rank >= 11 && high_ranked.include?(card) == false
        high_ranked << card
      end
    end
    @high_ranked = high_ranked
  end

  def percent_high_ranking
    ((high_ranked.length().to_f / cards.length().to_f) * 100).round(2)
  end

  def remove_card
    cards.shift
    if high_ranked.include?(cards[0]) == false
      high_ranked.shift
    end
  end

  def add_card(new_card)
    cards << new_card
  end
end
