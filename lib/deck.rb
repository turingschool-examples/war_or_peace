require_relative 'card'

class Deck
  attr_reader :cards

  def initialize(cards=[])
    card_check = cards.any? { |card| card.class != Card }
    if card_check || cards.class != Array
      @cards = Array.new
    else
      @cards = cards
    end
  end

  def rank_of_card_at(index_of_card)
    @cards[index_of_card].rank unless index_of_card.class != Integer || @cards[index_of_card] == nil
  end

  def high_ranking_cards
    @cards.length > 0 ? @cards.select { |card| card.rank >= 11 } : Array.new
  end

  def percent_high_ranking
    @cards.length == 0 ? 0.to_f : ((high_ranking_cards.length / @cards.length.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift unless @cards.length == 0
  end

  def add_card(new_card)
    @cards << new_card if new_card.class == Card
  end

end
