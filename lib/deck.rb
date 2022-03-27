require './lib/card'
class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

def rank_of_card_at(index)
  cards[index].rank
end


  def high_ranking_cards
    high_ranking = []
    cards.each do |card|
      if card.rank >= 11
        high_ranking << card
      end
    end
    return high_ranking
  end

  def percent_high_ranking
    decimal = high_ranking_cards.count.to_f/ @cards.count
    percent = (decimal * 100).round(2)
  end

  def remove_card
    cards.shift
end

  def add_card(card)
    cards << card
  end
end
