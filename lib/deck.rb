require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(ind)
    @cards[ind].rank
  end

  def high_ranking_cards
    @cards.delete_if {|high_card| high_card.rank <= 10}
  end

  def percent_high_ranking
  end

  def remove_card
  end

  def add_card
  end

end
