class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  attr_reader :cards

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      high_cards.push(card) if card.rank > 11
    end
    high_cards
  end

  def percent_high_ranking
    high_cards = high_ranking_cards
    high_cards.length / @cards.length
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
end
