class Player 
    attr_accessor :name,
                :deck, 
                :has_lost 

    def initialize(name, deck)
        @name = name
        @deck = deck
        @has_lost = false
    end

    def has_lost?
        @has_lost
        if @deck.cards.count == 0
             true
        elsif @deck.cards.count > 0
            false
        end 
        
        
    end


end


