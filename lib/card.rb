class Card
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end

# class Deck
#   attr_reader :cards
#   def initialize(cards)
#     @cards = cards
#   end
# end
