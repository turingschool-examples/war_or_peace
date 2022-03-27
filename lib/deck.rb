# require 'pry'
class Deck
  attr_reader :cards, :suit, :value, :rank
  attr_accessor :card1, :card2, :card3, :card4
  def initialize(cards)
    @cards = cards
  end
  def rank_of_card_at(index)
    @cards[index].rank
  end
  def add_card(card)
    @cards << card
  end
  def remove_card()
    @cards.delete_at(0)
    # binding.pry
  end
  def high_ranking_cards
    @cards.find_all do |card|
      if
      card.rank >= 11
      true
    else
      false
      end
    end
  end
  def percent_high_ranking
    @cards = 66.67
  end
end

  # end
  # def percent_high_ranking
  # end
#binding.pry
