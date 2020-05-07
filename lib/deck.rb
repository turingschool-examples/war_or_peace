
class Deck
  attr_reader :cards, :high_cards

  def initialize(cards)
    @cards = cards
    @high_cards = []
  end

  def rank_of_card_at(location)
    cards[location].rank
  end

#can this be more succinct?
  def identify_high_ranking_cards
    cards.map do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

#can this be more succinct?
  def percent_high_ranking
    high = 0.0
    low = 0.0
    cards.map do |card|
      if card.rank >= 11
        high += 1
      else
        low += 1
      end
    end
    (high * 100 / (high + low)).ceil(2)
  end

  def remove_card
    cards.shift
  end


end


# initializer sets instance variables == arguments
