# frozen_string_literal: true

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    @cards[position].rank
  end

  def high_ranking_cards
    # @cards.select { |card| card.rank >= 11 }
    @cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    percentage_high_cards = @cards.select do |card|
      card.rank >= 11
    end
    percent = percentage_high_cards.length.to_f / @cards.length
    (percent * 100).round(1)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
