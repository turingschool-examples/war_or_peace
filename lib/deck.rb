class Deck

  attr_reader :cards

  def initialize(cards)
    @cards    = cards
  end

  def rank_of_card_at(index)
    if index < @cards.length
      @cards[index].rank
    else
      0 #returns 0 if there is no card at index
    end
  end

  def high_ranking_cards
    @cards.find_all do |card|
      card if card.rank >= 11
    end
  end

  def percent_high_ranking
    high_ranking_cards.size.to_f / @cards.size.to_f * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
