class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(i)
    @cards[i].rank
  end

  def first_card
    rank_of_card_at(0)
  end

  def third_card
    rank_of_card_at(2)
  end

  def high_ranking_cards
    highs = []
    @cards.each do |card|
      if card.rank >= 11
        highs << card
      end
    end
    highs
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

end
