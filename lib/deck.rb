class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_cards_at(index_location)
    @cards.at(index_location).rank
  end

  def high_ranking_cards
    high_rank_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_rank_cards << card
      end
    end
    high_rank_cards#require "pry"; binding.pry
  end

  def percent_high_ranking
    percent_high_rank = ((high_ranking_cards.count.to_f / cards.count.to_f) * 100).round(2)
  end

  def
end
