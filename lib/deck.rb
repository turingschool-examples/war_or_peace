require 'pry'
require './lib/card'

class Deck
  attr_reader :cards, :suit, :value, :rank
  def initialize(cards)
    @cards = cards
  end

  def high_ranking_cards
    high_ranking = []
    @cards.each do |card|
      if card.rank >= 11
        high_ranking << card
      end
    end
    high_ranking
  end

  def percent_high_ranking
    num_high_rank = 0.0
    total_card = @cards.count.to_f
    @cards.each do |card|
      if card.rank >= 11
        num_high_rank += 1
      else
      end
    end
    high_percent = (num_high_rank / total_card) * 100
    high_percent.round(2)
  end

  def add_card(card)
    cards.push(card)
  end

  def remove_card
    cards.shift
  end

  def rank_of_card_at(index)
    @cards[index].rank
    end
  end
