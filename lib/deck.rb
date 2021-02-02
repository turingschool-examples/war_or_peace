require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(0, 2)

    return
  end

  def high_ranking_cards
  end

  def percent_high_ranking
  end

  def remove_card
    cards.shift
  end

  def add_card
  end
end
