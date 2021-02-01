class Deck
  attr_reader :cards

  def initialize(c)
    @cards = c
  end

  def rank_of_card_at(index)
    self.cards[index].rank if index < self.cards.size
  end

  def high_ranking_cards
    cards.find_all {|c| c.rank >= 11}
  end

  def percent_high_ranking
  end

  def remove_card
  end

  def add_card
  end

end
