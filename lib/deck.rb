
class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards

  end

  def high_ranking_cards
    high_cards = Array.new
    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    high_cards = Array.new
    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    percent_high = high_cards.count / @cards.count
    percent_high
  end

  def rank_of_card_at(index)
    @cards[index].rank 
  end

end
