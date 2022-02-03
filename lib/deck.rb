require './lib/card'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(rank)
    @rank_of_card_at = cards.fetch(rank)
    @rank_of_card_at.rank
    #Implied return of specific rank value
  end

  def high_ranking_cards
    face_cards = []
    @cards.each do |card|
      if card.rank >= 11
        face_cards << card
      end
    end
    return face_cards
  end 
end
