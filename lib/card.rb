class Card
attr_reader :suit

    def initialize(suit, value, rank)
        @rank = rank
        @suit = suit
        @value = value
    end
end