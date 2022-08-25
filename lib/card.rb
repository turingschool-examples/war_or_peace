class Card
  # Suit (:spades, :hearts, :diamonds, :clubs)
  # Value ('Ace', 'King', 'Queen', 'Jack', 'Numbered')
  # Rank (1-13)
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end