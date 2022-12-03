class Turn
    attr_reader :player1, :player2, :spoils_of_war
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []


    end

    def type
        if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            :war
        else player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
            :basic
        end
    end

    def winner
        if type == :war
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                player1
            else player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
                player2
            end 
        else type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
            player1
            else player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
            player2
            end

        end

    end

    def pile_cards
        if type == :war
            @spoils_of_war << player1.deck.cards.shift(3)
            @spoils_of_war << player2.deck.cards.shift(3)
            @spoils_of_war.flatten!

        else type == :basic
            @spoils_of_war << player1.deck.cards.shift
            @spoils_of_war << player2.deck.cards.shift
        end
    end

    def award_spoils(winner)
        winner.deck.cards << spoils_of_war.shift until spoils_of_war.empty?
    end


end