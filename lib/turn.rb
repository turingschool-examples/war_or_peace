class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def turn

    def basic_turn
        #turn is one in which the rank_of_card_at(0)
        # from the players’ decks are not the same rank.
    end

    def war_turn
        # occurs when both players’ rank_of_card_at(0) are the same.
    end

    def mutually_assured_destruction
        # when both players’
        # rank_of_card_at(0) AND rank_of_card_at(2) are the same.
    end


end