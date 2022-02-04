require 'pry'
require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards=[])
    @cards = cards
  end

  def rank_of_card_at(card)
     @cards[card].rank
  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    high_cards = []

    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end

    percent = high_cards.count / @cards.count.to_f
    percent.round(4) * 100
  end

  def remove_card
    @cards.shift
    cards
  end

  def add_card(card)
    @cards << card
  end

end
# binding.pry
