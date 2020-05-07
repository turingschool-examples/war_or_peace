#Deck.rb
require 'pry'
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    new_array = []
    cards.each do |card|
      if card.rank >= 11
        return new_array << card
      end
    end
  end

  def percent_high_ranking
    new_array = []
    i = 0.00
    x = 0.00
    percent = 0

    cards.each do |card|
      i += 1
      if card.rank >= 11
        x += 1
      end
    end

    percent = (x / i) * 100
    return percent.round(2)
  end

  def remove_card
    cards.shift
    return cards
  end


end
