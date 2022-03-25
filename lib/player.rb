require './lib/card'
require './lib/deck'

class Player 
    attr_reader :name, :deck
    def initialize(name, deck)
        @name = name
        @deck = deck
    end

    def has_lost?
        if @deck.cards.count <= 0
            true
        else
            false
        end
    end

    def deck_remove_card
        @deck.cards.shift
    end 
end