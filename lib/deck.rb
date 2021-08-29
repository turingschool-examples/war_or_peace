require './lib/card.rb'
require 'pry'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card(index)
    @cards == @rank[index]
    return result

  end
end
  # def add_card(card)
  #   @cards << card
  # end
