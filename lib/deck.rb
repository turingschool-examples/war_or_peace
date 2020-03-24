class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if @cards[index] == nil
      rank = 0
    else
      @cards[index].rank
    end
  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    (( high_ranking_cards.length.to_f / @cards.length.to_f) * 100.00).round(2)
  end

  def remove_card(number = 1)
    @cards.shift(number)
  end

  def add_card(card)
    @cards << card
  end
end
