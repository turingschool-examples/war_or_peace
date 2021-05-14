class Player
    attr_reader :name, :deck

    def initialize(name, deck = nil)
        @name = name
        @deck = deck
    end 

    def has_lost?
        if @deck.cards.length == 0 
            p true
        else 
            p false
        end 
    end
end 

