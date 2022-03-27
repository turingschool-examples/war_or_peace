# require 'pry'
class Deck
  attr_reader :cards, :percent_high_ranking
  # :suit, :value, :rank
  # attr_accessor :card1, :card2, :card3, :card4
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
    @high_ranking_cards = []
    @cards.each_with_index do |card, index|
      if rank_of_card_at(index) >= 11
        @high_ranking_cards << card
      end
    end
  end
  # @cards.find_all do |card|
  #   if
  #   card.rank >= 11
  #   true
  # else
  #   false
  #   end
  # end
  def percent_high_ranking
    @percent_high_ranking = (high_ranking_cards.length.to_f / @cards.length) * 100
    @percent_high_ranking.round(2)
  end
end

  # end
  # def percent_high_ranking
  # end
#binding.pry
