require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards.at(index).rank
  end

  def high_ranking_cards
    high_ranks = []
    @cards.each do |card|
      if card.rank >= 11
        high_ranks << card
      end
    end
    high_ranks
  end

  def percent_high_ranking
    percent = 100.00 * high_ranking_cards.length
    percent = percent / @cards.length
    percent.round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.append(card)
  end
end
