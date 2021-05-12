require 'pry'

class Deck
  attr_reader :cards
  def initialize (cards)
    @cards = cards
    @high_cards = []
  end
  def rank_of_card_at (index)
    @cards[index].rank
  end
  def high_ranking_cards
    @high_cards = @cards.select do |x|
      #binding.pry
      x.rank >= 11
    end
  end
  def percent_high_ranking
    #Sbinding.pry
    ((@high_cards.length.to_f / @cards.length.to_f) * 100).round(2)
  end
  def remove_card
    @cards.shift
  end
  def add_card(card)
    @cards << card
  end
end
