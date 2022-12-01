class Turn
    attr_reader :player1, 
                :player2, 
                :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
    end

    def type
        if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            p :war
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            p :mutually_assured_destruction
        else
            p :basic
        end
    end
end