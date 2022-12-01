class Player
    attr_reader :name,
                :deck

    def initialize(name, deck)
        @deck = deck
        @name = name
    end

    def has_lost?
        return false if @deck.cards.length > 0
        true
    end
end