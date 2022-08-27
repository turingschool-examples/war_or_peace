class Deck
attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(element_of_cards)
    @cards[element_of_cards].rank
  end

  def high_ranking_cards
    @cards.select { |card| card.rank >= 11 }
  end

  def percent_high_ranking
     (high_ranking_cards.count.fdiv(@cards.count)*100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(new_card_to_deck)
    @cards.push(new_card_to_deck)
  end
end