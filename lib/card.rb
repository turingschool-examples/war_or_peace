class Card

    attr_reader :suit, :value
    attr_accessor :rank

    def initialize(suit, value, rank)
        @suit = suit
        @value = value
        @rank = rank
    end
end