require './lib/card'
require "pry"

class Deck
  attr_reader :cards

  def initialize(cards)
    @deck = []
    @cards = cards
  end

  def shuffle
    unless @cards.empty?
      @cards.shuffle!
    end
  end

  def add_card(card)
    @deck << card
  end

  def remove_card
    @deck.shift
  end

  def rank_of_card_at

  end

  def percent_high_ranking

  end

  def high_ranking_cards

  end

end
