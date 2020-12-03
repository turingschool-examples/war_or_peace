require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def high_ranking_cards
    @cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    return high_ranking_cards().length / @cards.length.to_f
  end

  def add(card)
    @cards.push(card)
  end

  def remove
    @cards.shift
  end
end
