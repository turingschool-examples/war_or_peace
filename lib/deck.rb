

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
   @cards[index].rank
  end

  def high_ranking_cards
    @cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    percent = high_ranking_cards.length.to_f / cards.length.to_f * 100
    percent.round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card
    @cards.push(cards)
  end
end
