class Turn 
    attr_reader :player1,
                :player2,
                :spoils_of_war
    def initialize (player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        :basic if player1.deck.cards[0] != player2.cards[0]
    end

    def winner
        if player1.deck.cards[0].rank > player2.cards[0].rank then player1
        elsif player2.deck.cards[0].rank > player2.cards[0].rank then player2
        end 
    end

    def pile_cards
        spoils_of_war << player1.deck.cards.shift
        spoils_of_war << player2.deck.cards.shift
    end
end