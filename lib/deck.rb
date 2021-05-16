class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    # require "pry"; binding.pry
    return 0 if cards[index] == nil 
    #error fix
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.find_all { |card| 11 <= card.rank}
  end

  def percent_high_ranking
    ((high_ranking_cards.size.to_f/@cards.size) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

end
