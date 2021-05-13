class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      high_cards << card if card.rank >= 11
    end
    high_cards
  end

  def percent_high_ranking
    (self.high_ranking_cards.count.fdiv(@cards.count) * 100).round(2)
  end

  # def remove_card will remove top card
  def remove_card
    @cards.delete_at(0)
  end

  # def add_card will add card to
  def add_card(card)
    @cards << card
  end

end
