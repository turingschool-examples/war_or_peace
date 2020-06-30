class Card
 attr_reader  :suit,
              :value,
              :rank,
              :cards

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
    @cards = []

  end

end
