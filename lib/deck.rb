class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if @cards == []
      0
    elsif @cards.length == 2
      0
    else
      @cards[index].rank
    end
  end

  def high_ranking_cards
    @cards.find_all { |card| card.rank >= 11 }
  end

  def percent_high_ranking
    ((high_ranking_cards.length.to_f / @cards.length) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(new_card)
    @cards << new_card
  end

end
