require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def high_ranking_cards
    high_ranking_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_ranking_cards.push(card)
      end
    end
    return high_ranking_cards
  end

  def percent_high_ranking
    return high_ranking_cards().length / @cards.length.to_f
  end

  def add(card)
    @cards.push(card)
  end
end
