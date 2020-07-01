require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    @cards[position].rank
  end

  def high_ranking_cards
    @cards.select {|card| card.rank >= 11}
  end

  def percent_high_ranking
    (((@cards.select {|card| card.rank >= 11}).length.to_f) / (@cards.length.to_f) * 100).round(2)
  end

  def remove_card
    @cards.slice!(0)
  end

  def add_card(card)
    @cards << card
  end
end
