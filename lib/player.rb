class Player
    attr_reader :name, :deck
    def initialize(name, deck)
        @name = name
        @deck = deck
    end
    
    def has_lost?
        if deck.cards.count > 0 then false
        elsif deck.cards.count == 0 then true
        end 
    end
end