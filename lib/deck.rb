require_relative 'card'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if index >= @cards.length
      return nil
    else
      @cards[index].rank
    end
  end

  def high_ranking_cards
    high_rank = []
    @cards.map do |card|
      if card.rank >= 11
        high_rank << card
      end
    end
    high_rank
  end

  def percent_high_ranking
    percent = 0.0
    @cards.each do |card|
      if card.rank >= 11
        percent += 1.0
      end
    end
    (percent / @cards.count.to_f).round(4) * 100.0
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
