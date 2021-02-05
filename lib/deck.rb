class Deck
  attr_reader :cards

  def initialize(*cards)
    @cards = cards
  end

  def empty?
    cards.empty?
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    high_ranking_cards = 0
    cards.select do |card|
      if card.rank >= 11
        high_ranking_cards += 1
      end
    end
    (high_ranking_cards.to_f / cards.length.to_f * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    cards << card
  end


end
