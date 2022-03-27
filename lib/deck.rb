require './lib/card.rb'
require 'pry'
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    @high_ranking_cards = high_ranking_cards
  end

  def rank_of_card_at(index)
    if @cards[index].nil?
      0
    else @cards[index].rank
    end
  end

  def high_ranking_cards
    @high_rank = []
    @cards.each do |card|
      if card.rank > 10
        @high_rank << card
      end
    end
  return @high_rank
  end

  def percent_high_ranking
    percent = ((@high_rank.count.to_f / @cards.count) *100).round(2)
  end

  def remove_card
    @cards.shift
    @cards
  end

  def add_card(new_card)
    @cards << new_card
  end


end
