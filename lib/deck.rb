require './lib/card'
require 'pry'

class Deck
  attr_reader :cards

  def initialize (cards = [])
    @cards = cards
  end

  def rank_of_card_at(index_location)
    @cards[index_location].rank
  end

  def high_ranking_cards
    @cards.find_all {|card| card.rank >= 11}
    # binding.pry
  end
end
