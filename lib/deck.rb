require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(ind)
    @cards[ind].rank
  end

  def high_ranking_cards
    @cards.select {|high_card| high_card.rank > 10}
  end

  def percent_high_ranking
    def high_cards
      high_ranking_cards.length
    end

    def original_cards
      @cards.length
    end

    ((high_cards / original_cards.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift #.shift takes first item from array, returns item as value
  end

  def add_card(new_card)
    @cards << new_card
  end

end
