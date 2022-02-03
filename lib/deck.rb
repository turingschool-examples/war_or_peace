require 'pry'

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = []
  end

  #def cards
  #  @cards = card
  #end

  def rank_of_card_at(location)
    return cards(location)
  end
end
