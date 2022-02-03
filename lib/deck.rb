class Deck
  attr_reader :cards
  def initialize(cards = [])
    @cards = cards
  end
  def rank_of_card_at(index)
    @cards[index].rank
    # require 'pry'; binding.pry
  end

  def high_ranking_cards
    high_ranked = []
    cards.each do |card|
      if card.rank >= 11 && high_ranked.include?(card) == false
        high_ranked << card
      end
    end
    return high_ranked
  end

  def percent_high_ranking
    ((high_ranking_cards.length().to_f / cards.length().to_f) * 100).round(2)
  end

  def remove_card
    cards.shift
    if high_ranking_cards.include?(cards[0]) == false
      high_ranking_cards.shift
    end
  end

  def add_card(new_card)
    cards << new_card
  end
end
