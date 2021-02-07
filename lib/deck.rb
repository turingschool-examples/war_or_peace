class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    return 0 if cards[index] == nil
    @cards[index].rank
  end

  def high_ranking_cards
    high_array = []
    @cards.each do |card|
      high_array << card if card.rank > 10
    end
    high_array
  end
  #
  def percent_high_ranking
      sum = ((high_ranking_cards.length / @cards.length.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
