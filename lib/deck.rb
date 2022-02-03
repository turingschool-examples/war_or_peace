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

end
