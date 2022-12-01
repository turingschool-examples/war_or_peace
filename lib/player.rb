class Player
    attr_reader :name, :deck
    def initialize(name, deck)
        @name = name
        @deck = deck
        @has_lost = false
    end

    def has_lost?
        #reassigns
        @has_lost = true if deck.cards.empty? 
        @has_lost
    end
end