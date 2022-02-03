require './card'

class Deck
  attr_reader :cards, :rank_of_card_at, :high_ranking_cards, :percent_high_ranking

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

  def percent_high_ranking
    high_ranking_cards
    @percent_high_ranking = high_ranking_cards.size / 2
      number = high_ranking_cards.size / 3.to_f * 100.to_f
        return number.round(2)
  end
end
# require 'pry'; binding.pry

#secondary solutions?
# def percent_high_ranking
#   high_ranking_cards
#   high = @high_ranking_cards
#   total = cards.count
# end
