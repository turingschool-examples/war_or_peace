require_relative 'card'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if index >= @cards.length
      return nil
    else
      @cards[index].rank
    end
  end
end
