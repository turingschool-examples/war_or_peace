require './lib/card.rb'
require 'pry'
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @high_ranking_cards = []
    @cards.each do |card|
      if card.rank > 10
        @high_ranking_cards << card
      end
    end
    return @high_ranking_cards

    def percent_high_ranking
      @percent_high_ranking = ((@high_ranking_cards.legnth / @cards.count) * 100).to_i
    end
    return @percent_high_ranking
  end

  # def remove_card
  #   @card.pop
  # end

end
