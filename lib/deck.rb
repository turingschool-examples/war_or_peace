class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    # require "pry"; binding.pry
    cards.select do |card|
      card.rank > 11
      # require "pry"; binding.pry
    end
  end

  def percent_high_ranking
    high_ranking_percentage = []
    cards.each do |card|
      if card.rank >= 11
        high_ranking_percentage << card
        # require "pry"; binding.pry
      end
    end
    (high_ranking_percentage.count.to_f / cards.count.to_f * 100).round(2)
  end

  def remove_card
    # require "pry"; binding.pry
    cards.shift
    # require "pry"; binding.pry
  end

  def add_card(card)
    # require "pry"; binding.pry
    cards << card
  end
  
end
