require 'rspec'
require 'pry'

class Deck
  attr_reader :cards, :cards_above_eleven

  def initialize(cards)
    @cards = cards
    @cards_above_eleven = []

  end

  def rank_of_card_at(card_at)
    @cards[card_at]
  end

  def high_ranking_cards
    @cards.each do |card|
      if card >= 11
         @cards_above_eleven << card
      end
    end
    @cards_above_eleven

  end

  def percent_high_ranking
    high_ranking_cards
    ((@cards_above_eleven.count.to_f / @cards.count) * 100).round(2)
  end

  def remove_card
    @cards.delete_at(0)
    @cards
  end

  def add_card(card)
    @cards.push(card.rank)
    binding.pry
  end

end
