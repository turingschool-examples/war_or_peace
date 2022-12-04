class Turn 

    attr_reader :player1, :player2, :spoils_of_war
    def initialize (player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        
        if player1.deck.cards_arr[0] == player2.deck.cards_arr[0] && player1.deck.cards_arr[2] == player2.deck.cards_arr[0]
            :mutually_assured_destruction
        elsif player1.deck.cards_arr[0] == player2.deck.cards_arr[0]
            :war
        elsif player1.deck.cards_arr[0] != player2.deck.cards_arr[0]
            :basic
        end
    end
end
