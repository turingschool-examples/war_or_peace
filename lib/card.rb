class Card
  # SUITS = [:heart, :diamond, :spade, :club]
  # VALUES = [14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
  # RANKS = ['Ace', 'King', 'Queen', 'Jack', 'Ten', 'Nine', 'Eight',
  #   'Seven', 'Six', 'Five', 'Four', 'Three', 'Two', 'One']

  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end
