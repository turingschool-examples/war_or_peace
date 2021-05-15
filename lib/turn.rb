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
        if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            :war
        else
            :basic
        end
    end

    def winner
        case type
        when :basic
            player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
        when :war
            player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
        else
            'No Winner'
        end
    end

    def pile_cards
        case type
        when :basic
            spoils_of_war << player1.deck.remove_card
            spoils_of_war << player2.deck.remove_card
        when :war
            spoils_of_war.concat(player1.deck.cards[0..2])
            spoils_of_war.concat(player2.deck.cards[0..2])
        else
            player1.deck.remove_card * 3
            player2.deck.remove_card * 3
        end
    end

    def award_spoils(winner)
        winner.deck.cards.concat(spoils_of_war)
    end
end