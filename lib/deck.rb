require './card'

class Deck
  attr_reader :cards

  def initialize(card_parameter)
      @cards = card_parameter
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  
end
