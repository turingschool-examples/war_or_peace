require './lib/card'

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    cards[position].rank
  end

  def high_ranking_cards
    @cards.select { |cards| cards.rank >= 11}
    end
  end
