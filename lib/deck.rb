class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.find_all do |number|
    number.rank >= 11
    end
  end

  def percent_high_ranking
    percent_high_ranking = (Float(high_ranking_cards.count) / Float(cards.count) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(new_card)
    @cards.push(new_card)
  end
end
