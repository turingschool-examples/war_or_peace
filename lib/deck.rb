require 'pry'

class Deck
  attr_reader :cards
  def initialize (cards)
    @cards = cards
    @high_cards = []
  end

  def rank_of_card_at (index)
    #binding.pry
    @cards[index].rank
  end

  def high_ranking_cards
    @high_cards = @cards.select do |x|
      x.rank >= 11
    end
  end

  def percent_high_ranking
    ((@high_cards.length.to_f / @cards.length.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

  def shuffle
    @cards.shuffle
  end
end
