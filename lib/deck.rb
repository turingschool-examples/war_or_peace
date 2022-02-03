require './lib/card.rb'
require 'rspec'

class Deck

  attr_reader :cards

  def initialize (cards)
    # formatted as an array of Card instances
    @cards = cards
  end

  def rank_of_card_at (location)
    # card array of format (:suit, "face value", rank)
    rank = @cards[location].rank
    return rank
  end

  def high_ranking_cards()
    high_cards = []
    @cards.each do |card|
      if (card.rank>=11)
        high_cards << card
      end
    end
    return high_cards
  end

  def percent_high_ranking
    ((100*high_ranking_cards.length.to_f) / @cards.length.to_f).round(2)
  end

  def remove_card
    @cards.shift
    #WARNING: We'll need to do something with this card later, so we'll probably ned to send this somewhere not just forget it
  end

  def add_card(card)
    @cards << card
  end
end
