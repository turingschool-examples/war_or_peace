class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end
    
    def type
        return :basic if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank 
    end

    def winner
        return @player1 if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        return @player2
    end

    def pile_cards
        if type == :basic
            spoils_of_war << @player1.deck.cards[0]
            spoils_of_war << @player2.deck.cards[0]
        end
    end
end