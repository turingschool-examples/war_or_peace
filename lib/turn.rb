class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if basic_turn
            :basic
        elsif war_turn
            :war
        else
            :mutually_assured_destruction
        end
    end

    def basic_turn
        @player1.deck.cards.first.rank != @player2.deck.cards.first.rank

    end

    def war_turn
        @player1.deck.cards.first.rank == @player2.deck.cards.first.rank
    end

end