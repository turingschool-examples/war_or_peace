class Deck
  attr_reader :cards

  def initialize(cards)
     @cards = cards
  end

  def rank_of_card_at(position)
    if position < @cards.length
      @cards[position].rank
    else
      nil
    end
  end

  def high_ranking_cards
    @cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    high_ranking_cards.length.to_f / @cards.length.to_f
  end

  def remove_card
    @cards.pop
  end

  def add_cards(new_card)
    @cards.push(new_card)
  end

end
