class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end
end
#binding.pry
deck = Deck.new(cards)
