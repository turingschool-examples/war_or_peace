class Player

    attr_reader :name, :deck
    def initialize(name, deck)
        @name = name
        @deck = deck
        @has_lost = false

    end

    def has_lost?
        if @deck.cards == [] 
            @has_lost = true
            require 'pry'; binding.pry
        end

        @has_lost
    end
end

