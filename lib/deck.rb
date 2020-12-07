class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end
  def cards
    @cards
  end

  def rank_of_card_at(index)
    return @cards[index].rank
  end

  def high_ranking_cards
    high_cards = Array.new
    @cards.each do |card|
      if card.rank > 11
        high_cards.push(card)
      end
    end
    high_cards
  end

  def percent_high_ranking
    high_cards = high_ranking_cards
    high_cards.length / @cards.length
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.append(card)
  end
end
