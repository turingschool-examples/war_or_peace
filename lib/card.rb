# This file creates a Card class with suit, name, and value attributes, to be used for the other parts of War.
class Card
    # Attribute Reader for all values.
    attr_reader :suit, :name, :value
    # Initializes values in a new card.
    def initialize(suit, name, value)
      @suit = suit
      @name = name
      @value = value
    end

end

