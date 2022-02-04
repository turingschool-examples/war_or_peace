require './lib/card'

class Deck
  attr_reader :cards, :rank_of_card_at, :high_ranking_cards, :percent_high_ranking, :face_cards, :remove_card
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(rank)
    @rank_of_card_at = cards.fetch(rank)
    @rank_of_card_at.rank
    #Implied return of specific rank value
  end

  def high_ranking_cards
    @face_cards = []
    @cards.each do |card|
      if card.rank >= 11
        @face_cards << card
      end
    end
    return face_cards
  end

  def percent_high_ranking
    high_ranking_cards
    total = face_cards.count / cards.count.to_f * 100
    return total.round(2)
  end

  def remove_card
    @cards.delete_at(0)

  end

end
