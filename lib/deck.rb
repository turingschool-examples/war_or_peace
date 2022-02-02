
class Deck

  attr_reader :cards

  def initialize(start_cards)

    @cards = start_cards

  end

  def rank_of_card_at(place)
      @cards[place]
  end

  def high_ranking_cards
    high_cards = []

    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking

  end

  def remove_card

  end

  def add_card

  end

end
