class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(i)
    if @cards[i] == nil
      p "Card not found at position #{i}"
      0
    else
      @cards[i].rank
    end
  end

  def high_ranking_cards
    @cards.map do |card|
      card if card.rank >= 11
    end
  end

  def percent_high_ranking
    percent = 100.0 * high_ranking_cards.size / @cards.size
    percent.round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

end
