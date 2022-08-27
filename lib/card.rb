class Card
  # Suit (:spade, :heart, :diamond, :club)
  # Value ('Ace', 'King', 'Queen', 'Jack', 'Numbered')
  # Rank (2-14)
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end