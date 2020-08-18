require_relative 'card'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if index >= @cards.length
      return nil
    else
      @cards[index].rank
    end
  end

  def high_ranking_cards
    high_rank = []
    @cards.map do |card|
      if card.rank >= 11
        high_rank << card
      end
    end
    high_rank
  end
end
