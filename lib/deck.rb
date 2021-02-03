class Deck
  attr_accessor :cards

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
    (high_ranking_cards.length.to_f / @cards.length * 100).round(2)
  end

  def remove_card
    @cards.delete_at(0)
  end

  def add_card(card)
    @cards.push(card).last
  end
end
