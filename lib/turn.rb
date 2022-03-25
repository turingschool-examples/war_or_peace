require './lib/player'

class Turn

    attr_reader :player1, :player2, :spoils_of_war

    def initialize (player1, player2, basic, war, mutually_assured_destruction)
        @player1 = player1
        @player2 = player2
        @basic = player1.deck.rank_of_card_at(0) != player2.decl.rank_of_card_at(0)
        @war = player1.deck.rank_of_card_at(0) == player2.decl.rank_of_card_at(0)
        @mutually_assured_destruction = player1.deck.rank_of_card_at(0, 2) != player2.decl.rank_of_card_at(0, 2)
    end

    def type(type)
        if type = player1.deck.rank_of_card_at(0) != player2.decl.rank_of_card_at(0)
            @basic
        elsif player1.deck.rank_of_card_at(0) == player2.decl.rank_of_card_at(0)
            @war
        elsif player1.deck.rank_of_card_at(0, 2) != player2.decl.rank_of_card_at(0, 2)
            @mutually_assured_destruction
        end
    end

    def winner
        if 



    end

    def pile_cards
    end


end