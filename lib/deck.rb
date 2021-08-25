require './lib/card.rb'

class Deck
  attr_reader :cards, :high_rank_cards

  def initialize(cards)
    @cards = cards
    @high_rank_cards = []
  end

  def rank_of_card_at(index)
    return @cards[index].rank
  end

  def high_ranking_cards
    @cards.each do |card|
      if card.rank >= 11
        @high_rank_cards << (card)
      end
    end
    return @high_rank_cards
  end
=begin
  def percent_high_ranking
    percent = (@high_rank_cards / @cards.length) * 100
    return percent
  end

  def remove_card
    @cards.shift
  end

  def add_card
    @cards.append
  end
=end
end
