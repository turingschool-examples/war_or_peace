
require './lib/card'

class Deck

  attr_reader :card, :suit, :value, :rank

  def initialize(cards)
    @cards = cards
    @card = card
    @suit = suit
    @value = value
    @rank = rank

  end

  def cards



  end
end
 card1 = Card.new(:diamond, 'queen', 12)
