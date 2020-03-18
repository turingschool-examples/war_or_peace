# deck class
require './lib/card.rb'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(int)
    cards[int].rank
  end


  def high_ranking_cards
    high_ranking_array = []
    cards.each do |card_rank|
      if card_rank.rank >= 11 == true
        high_ranking_array << card_rank
      end
    end
    return high_ranking_array
  end


end
