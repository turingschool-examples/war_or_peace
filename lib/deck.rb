require './lib/card'

class Deck
  attr_accessor :cards

  def initialize(cards)

    @cards = cards

  end

  def rank_of_card_at(index)

    @cards[index].rank

  end

  def high_ranking_cards
    high_cards = []

    @cards.each do |high_card|
      if high_card.rank >= 11
        high_cards << high_card
      end
    end

    return high_cards

  end

  def percent_high_ranking
    total_high_rank_cards = 0.0
    total_cards = 0.0


    @cards.each do |high_card|
      total_cards += 1.0
      if high_card.rank >= 11
        total_high_rank_cards += 1.0
      end
    end

    return ((total_high_rank_cards/total_cards)*100).round(1)
  end

  def add_card(card)
    @cards << card
  end

  def remove_card
    @cards.pop
  end
end
