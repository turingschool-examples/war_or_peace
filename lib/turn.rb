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
        if 
            player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        elsif 
            (player1.deck.rank_of_card_at(0)) == (player2.deck.rank_of_card_at(0))
            :war
        else
            :basic
        end
    end

    def winner
        if type == :basic
           if (player1.deck.rank_of_card_at(0)) > (player2.deck.rank_of_card_at(0))
                return player1
           else
                return player2
           end

        elsif type == :war
            if (player1.deck.rank_of_card_at(2)) > (player2.deck.rank_of_card_at(2))
                return player1
            else
                return player2
            end

        else type == :mutually_assured_destruction
        end
    end
end