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
  end

  def percent_high_ranking
    self.high_ranking_cards.count / @cards.count
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
