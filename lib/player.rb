require './lib/card.rb'
require './lib/deck.rb'


class Player
    attr_reader :name,
                :deck

    def initialize(name, deck)
        @name = name
        @deck = deck
    end

    def has_lost?
        if (@deck.cards.count) >= 1
            return false
        else
            return true       
        end
    end
end
