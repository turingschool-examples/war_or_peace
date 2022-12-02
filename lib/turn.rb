class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
            :basic
        else
            :war
        end
    end

    def winner
        if type == :mutually_assured_destruction
            if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
                "No Winner"
            end
        elsif type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                player1
            else
                player2
            end
        else
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                player1
            else
                player2
            end
        end

    end

    def pile_cards
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
    end

    def award_spoils(winner)
        winner.deck.cards.concat(spoils_of_war)
    end


    def basic_turn
        #turn is one in which the rank_of_card_at(0)
        # from the players’ decks are not the same rank.
    end

    def war_turn
        # occurs when both players’ rank_of_card_at(0) are the same.
    end

    def mutually_assured_destruction_turn
        # when both players’
        # rank_of_card_at(0) AND rank_of_card_at(2) are the same.
    end


end