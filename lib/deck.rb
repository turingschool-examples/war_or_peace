class Deck
  attr_reader :cards
  def initialize(cards)
    # @rank = rank
    # @suit = suit
    # @value = value
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    (high_ranking_cards.length / @cards.length.to_f).round(4) *100
  end

  def remove_card
    @cards.shift
  end

  def add_card
    @cards.push[-1]
  end


end
