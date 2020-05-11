#Deck.rb
require 'pry'
class Deck
  attr_reader :cards, :rank

  def initialize(cards)
    @cards = cards
    @rank = rank
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    new_array = []
    cards.each do |card|
      if card.rank >= 11
        new_array << card
      end
    end
    new_array
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
    percent.round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(new_card)
    @cards << new_card
  end

end
