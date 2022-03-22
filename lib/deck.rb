require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    card = cards[index]
    card.rank
  end

  def high_ranking_cards
    high_rank = []
    @cards.each do |card|
      if card.rank >= 10
        high_rank << card
      end
    end
    return high_rank 
  end

end
