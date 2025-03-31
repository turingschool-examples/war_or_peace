# Card class must have suit, value, rank

class Card
    attr_reader :suit, :value, :rank

    def initialize(suit, value, rank)
        @suit = suit
        @value = value
        @rank = rank
    end

    

end

