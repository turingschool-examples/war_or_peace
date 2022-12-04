class Player

    attr_reader :name, :deck, :has_lost
    def initialize(name, deck)
        @name = name
        @deck = deck
        @has_lost = false
    end

    def has_lost?
        @deck.cards_arr.empty?
    end
end

