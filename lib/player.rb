class Player 
    attr_accessor :name,
                :deck, 
                :has_lost, 
                :cards 

    def initialize(name, deck)
        @name = name
        @deck = deck
        @has_lost = false
        @cards = cards
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


