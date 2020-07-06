require './lib/card.rb'

class Deck
  attr_reader :cards

  def initialize (cards)
    @cards = cards
  end

  def rank_of_card_at(array_loc)
    @cards.fetch(array_loc).rank
  end

  def high_ranking_cards
    @cards.delete_if {|high| high.rank < 11}
  end

  def percent_high_ranking
    denom = @cards.count
    @cards.delete_if {|high| high.rank < 11}
    num = @cards.count
    ((num.to_f / denom.to_f) * 100).to_i.to_s + "%"
  end

  def remove_card
    @cards.slice!(0)
  end

  def add_card(card_to_add)
    @cards << (card_to_add)
  end
end
