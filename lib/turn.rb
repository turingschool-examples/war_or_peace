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
         if player1.deck.cards.rank_of_card_at(0) == player2.deck.cards.rank_of_card_at(0)
            if player1.deck.cards.rank_of_card_at(2) == player2.deck.cards.rank_of_card_at(2)
                return :mutually_assured_destruction
            else
                return :war
            end
         else
            return :basic
        end
     end

     def winner
        
     end
end