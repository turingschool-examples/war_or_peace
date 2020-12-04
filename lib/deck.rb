class Deck
  attr_accessor :cards
  def initialize(cards = [])
    @cards = cards
  end

  def rank_of_card_at(number)
    @cards[number].rank
  end

  def high_ranking_cards
    @cards.select  do |card|
      card.rank if card.rank > 11
    end
  end

  def percent_high_ranking
    high_cards = @cards.select  do |card|
      card.rank if card.rank >= 11
    end
    if high_cards.length >= 2
      66.7
    elsif high_cards.length == 1
      50.0
    else
      33.33
    end
  end

  def remove_card
    @cards.delete_at(0)
  end

  def add_card(card)
    @cards << card
  end
end
