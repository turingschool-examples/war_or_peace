
class Card
    attr_reader :suit,
                :value,
                :rank

    def initialize(suit, value, rank)
        @suit = suit
        @value = value
        @rank = rank
    end

    def card
        card = Card.new(:diamond, 'Queen', 12)
end
    
end

