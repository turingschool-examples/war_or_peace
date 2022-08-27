require './lib/card'
require 'pry'

class Deck
  attr_reader :cards, :high_rank_cards

  def initialize(cards)
    @cards = cards
    @high_rank_cards = []
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  # Method high_ranking_cards should read rank of each card in the cards array, if the
  # card rank is greater than 10, the card should go into the high_rank_cards array


  def high_ranking_cards
    @cards.each do |card|
      if card.rank > 10
        then @high_rank_cards << card
      end
    end
    @high_rank_cards
  end

  def percent_high_ranking
    @cards.each do |card|
      if card.rank > 10
        then @high_rank_cards << card
      end
    end
  (@high_rank_cards.length.to_f / @cards.length.to_f * 100).round(2)
  end
end
