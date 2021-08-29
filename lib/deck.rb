require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if cards[index] != nil
      cards[index].rank
    else nil
    end
  end

  def high_ranking_cards
    high_rankers = []
    @cards.each {|card|
    if card.rank >= 11
      high_rankers << card
    end}
    high_rankers
  end

  def percent_high_ranking
    ((high_ranking_cards.length / @cards.length.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
