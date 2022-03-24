require './lib/card'
require 'pry'
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards

  end

  def rank_of_card_at(index)
    card = cards[index]
    card.rank
  end

  def high_ranking_cards
    high_rank = []
    @cards.each do |card|
      if card.rank >= 10
        high_rank << card
      end
    end
    return high_rank
  end

  def remove_card
    cards.shift
  end

  def add_card(new_card)
    cards.push(new_card)
  end

  def percent_high_ranking #Try to make this less ugly if you can, why can't use high_ranking_cards?
    high_rank = []
    @cards.each do |card|
      if card.rank >= 10
        high_rank << card
      end
    end
    num_of_cards = (@cards.count).to_f
    num_of_h_r = (high_rank.count).to_f #Figure out how to make the modulo work
    per_high =  num_of_h_r / num_of_cards
    return (per_high.round(4) * 100.00)
  end

end
