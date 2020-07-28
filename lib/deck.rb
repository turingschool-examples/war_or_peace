class Deck
  attr_reader :cards

  def initialize(*cards)
    cards = cards.flatten
    @cards = cards
  end

  def rank_of_card_at(index)
    if @cards.length >= (index - 1)
      @cards[index].rank
    else
      0
    end
  end

  def high_ranking_cards
    @cards.select {|card| card.rank >= 11}
  end

  def percent_high_ranking
    100 * (self.high_ranking_cards.length / @cards.length.to_f)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

end
