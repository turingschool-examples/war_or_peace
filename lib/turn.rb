class Turn 

    attr_reader :player1, :player2, :spoils_of_war
    def initialize (player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if player1.deck.cards_arr[0].rank == player2.deck.cards_arr[0].rank && player1.deck.cards_arr[2].rank == player2.deck.cards_arr[2].rank
            :mutually_assured_destruction
        elsif player1.deck.cards_arr[0].rank != player2.deck.cards_arr[0].rank
            :basic
        elsif player1.deck.cards_arr[0].rank == player2.deck.cards_arr[0].rank
            :war
        end
    end
end
