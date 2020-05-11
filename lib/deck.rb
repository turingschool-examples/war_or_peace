class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(i)
    if (@cards[i] == nil) && last_card?
      0
    elsif @cards[i] == nil
      @cards[-1].rank
    else
      @cards[i].rank
    end
  end

  def high_ranking_cards
    highs = @cards.map do |card|
      card if card.rank >= 11
    end
    highs.compact!
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

  def last_card?
    @cards[-1] == @cards[0]
  end
end
