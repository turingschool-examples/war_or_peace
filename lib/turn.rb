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
        if type == :mutually_assured_destruction
            player1.deck.remove_card
            player1.deck.remove_card
            player1.deck.remove_card
            player2.deck.remove_card
            player2.deck.remove_card
            player2.deck.remove_card
        elsif type == :basic
            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card
        else # war
            3.times do 
                @spoils_of_war << player1.deck.remove_card
            end
            3.times do
                @spoils_of_war << player2.deck.remove_card
            end
        end
    end

    def award_spoils(winner)
        winner.deck.cards.concat(spoils_of_war)
    end
end