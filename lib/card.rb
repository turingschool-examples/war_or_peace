# This file creates a Card class with suit, name, and value attributes, to be used for the other parts of War.
class Card
    # Attribute Reader for all values.
    attr_reader :suit, :value, :rank
    # Initializes values in a new card.
    def initialize(suit, value, rank)
      @suit = suit
      @value = value
      @rank = rank
    end

end

