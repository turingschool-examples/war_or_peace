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

  def high_ranking_total
    require "pry"; binding.pry
    cards.count.to_f
  end

  def percent_high_ranking
    ((high_ranking_cards.count / high_ranking_total) * 100).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards << card
  end
end
