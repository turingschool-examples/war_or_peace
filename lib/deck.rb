require './lib/card'

class Deck
  attr_reader :cards, :rank_of_card_at
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(rank)
    @rank_of_card_at = cards.fetch(rank)
      @rank_of_card_at.rank

  end






  # def cards
  #   @cards << cards
  # end
end
