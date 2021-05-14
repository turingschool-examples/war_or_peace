class Card
    attr_reader :value, :suit, :rank
    def initialize(suit, value, rank)
        @suit = suit
        @value = value
        @rank = rank
    end 
end 
