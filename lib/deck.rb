require './lib/card'

class Deck
  attr_reader :cards, :deck
  def initialize(cards)
    @cards = cards
    @high_ranking_cards = []
    @percent_high_ranking = 0
    @deck = []

  end

  def rank_of_card_at(place)
    @cards[place].rank
  end

def high_ranking_card
  @cards.each do |card|
    if card.rank < 11
      @cards.delete(card)
    end
    @high_ranking_cards = @cards

  end
end

  # def rank_of_card_at
  # end
  #
  # def high_ranking_cards
  #   if card.rank >= 11
  #   end
  #
  # end
  #
  # def percent_high_ranking
  # end
  #
  # def remove_card
  #   @cards.pop
  # end
  #
  # def add_card
  #   @cards.push
  # end

end
