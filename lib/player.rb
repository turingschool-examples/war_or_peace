class Player
    attr_reader :deck, :name 
    def initialize(name, deck)
        @name = name
        @deck = deck
    end

    def has_lost?
       
        @deck.cards.empty?
    
    end
end