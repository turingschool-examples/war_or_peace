require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_cards_at(index)
    @cards.at(index).rank
  end

  def high_ranking_cards
    high_ranks = []
    @cards.each do |card|
      if card.rank >= 11
        high_ranks << card
      end
    end
    high_ranks
  end

end
