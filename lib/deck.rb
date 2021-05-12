require_relative 'Card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at.index
    puts rank_of_card_at
  end

  def high_ranking_cards
    high_ranking_cards = []
    cards.each do |faces_and_aces|
      if @rank >= 11
        then high_ranking_cards << cards
      end
    puts high_ranking_cards
  end

  def percent_high_ranking
    total_cards = cards.count
    cards.each do |percent|
    percent_high_ranking = (high_ranking_cards / total_cards) * 100
    end
    puts percent_high_ranking
  end

  def remove_card
    cards.delete_at(0)
  end

  def add_card
    cards.append(add_card)
    @add_card = add_card
  end
end
