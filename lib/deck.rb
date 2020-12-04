class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    (@cards.length > index) ? @cards[index].rank : nil
  end

  def high_ranking_cards
    @cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    high_ranking = high_ranking_cards.length
    total_cards = @cards.length

    ((high_ranking.to_f / total_cards.to_f) * 100.0).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
end

