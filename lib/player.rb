class Player
    attr_reader :name, 
                :deck,
                :loss,
                :card_loss
    
    def initialize(name, deck)
        @name = name
        @deck = deck
        @loss = true
        @card_loss = 0
    end

    def has_lost?
        loss
    end




end