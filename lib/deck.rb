require './lib/card.rb'

class Deck

  attr_reader :cards

  def initialize (cards)
    @cards = cards
  end

  def rank_of_card_at (index)
    if @cards[index].nil?
      0
    else @cards[index].rank
    end
  end

  def high_ranking_cards
    high_rank = []
    cards.each do |card|
      if card.rank > 10
        high_rank << card
      end
      end
      return high_rank
  end

  def percent_high_ranking
    percent_high = high_ranking_cards.size.to_f / @cards.size.to_f * 100
    percent_high.round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
end
