
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

end
