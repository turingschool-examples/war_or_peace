require './lib/card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
  end

  def rank_of_card_at(position)
    @cards.rank[position]
  end

  def high_ranking_cards
    @cards.rank.select {|card| card >= 11}
  end

  def percent_high_ranking
    (high_ranking_cards.length).percent_of(@cards.length)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
