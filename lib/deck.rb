class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rankings
    cards.map do |card|
      card.rank
    end
  end

  def rank_of_card_at(index)
    rankings[index]
  end

  def high_ranking_cards
    ranks = []
    cards.each do |card|
      ranks << card if card.rank >= 11
    end
    ranks
  end

  def percent_high_ranking
    require "pry"; binding.pry
    rankings.sum
  end
end
