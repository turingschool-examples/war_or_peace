class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if @cards[index].nil?
      0
    else
      @cards[index].rank
    end
  end

  def high_ranking_cards
    royal_cards = []
    cards.each do |card|
      if card.rank > 10
        royal_cards << card
      end
    end
    royal_cards
  end

  def percent_high_ranking
    ((high_ranking_cards.count / cards.count.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
