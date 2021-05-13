require './lib/card'

class Deck
  attr_reader :cards, :high_ranking_cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(ind)
    @cards[ind].rank
  end

  def high_ranking_cards
    @high_ranking_cards = @cards.select {|high_card| high_card.rank > 10}
  end

  def percent_high_ranking
    def high_cards
      @cards.select {|high_card| high_card.rank > 10}.length.to_f
    end

    def original_cards
      @cards.length
    end

    ((high_cards / original_cards) * 100).round(2)
  end

  def remove_card
    @cards.slice!(0)
  end

  def add_card(new_card)
    @cards << new_card
  end

end
