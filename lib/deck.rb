require './lib/card.rb'

class Deck

  attr_reader :cards, :suit, :value, :rank

  def initialize (cards)
    @cards = cards[]
  end

  def cards
    @cards
  end

  rank_of_card_at = []
  def rank_of_card_at
    card.each do |rank|
      rank_of_card_at = rank
    end
    p rank_of_card_at 

  end

  def high_ranking_cards
    if rank > 10
      true
    end
  end

  def percent_high_ranking

  end

  def remove_card
    @cards.pop
  end

  def add_card
    @cards.append
  end

end
