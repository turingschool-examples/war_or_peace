require './card'

class Deck
  attr_reader :cards, :rank_of_card_at, :high_ranking_cards
  def initialize(cards)
    @cards = cards
  end

  # def rank_of_card_at(rank)
  #   @cards[rank].rank
  # end
  def rank_of_card_at(rank)
    @rank_of_card_at = cards.fetch(rank)
      @rank_of_card_at.rank
  end

  def high_ranking_cards
    @cards.each do |card|
      if card.rank < 11
        @cards.delete(card)
      end
    end
  end
# returns an array





# require 'pry'; binding.pry
  # def cards
  #   @cards << cards
  # end
end
# require 'pry'; binding.pry
