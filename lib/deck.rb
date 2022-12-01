require './lib/card'

class Deck
    attr_reader :name, :cards
    def initialize(name)
        @name = name
        @cards = []
    end

    def add_card(card)
        @cards << card
    end

    def rank_of_card_at(card_position)
        
    end
end 