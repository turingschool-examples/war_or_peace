class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    @cards[position].rank
  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      if card.rank > 9
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    percentage = (high_ranking_cards.length.to_f / @cards.length.to_f) * 100
    percentage.round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

end
