class Player
    attr_reader :name, :deck, :has_lost
    def initialize(name, deck)
        @name = name
        @deck = deck
    end
    def has_lost?
        if deck.cards.length < 1
            true
        else
            false
        end
    end
end