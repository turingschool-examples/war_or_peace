class Card
  attr_reader :suit, # Allows for reading the suit, value, and rank of a card
              :value,
              :rank

  def initialize(suit, value, rank) # Creates a card with a suit, value, and rank
    @suit = suit
    @value = value
    @rank = rank
  end
end
