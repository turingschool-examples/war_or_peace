require './lib/card'

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
         if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            if player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
                @type = :mutually_assured_destruction
            else
                @type = :war
            end
         else
            @type = :basic
        end
    end

     def winner
        if @type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                return player1
            else
                return player2
            end
        elsif @type == :war
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                return player1
            else
                return player2
            end
        elsif @type == :mutually_assured_destruction
            return "No Winner"
        end
    end

     def pile_cards
        if @type == :basic
            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card
        end
    end

end