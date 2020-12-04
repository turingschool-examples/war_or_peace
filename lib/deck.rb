class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if @cards[index] != nil
      @cards[index].rank
    else
      0
    end
  end

  def high_rank_cards
    @cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    ((high_rank_cards.length.to_f / @cards.length.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

end
