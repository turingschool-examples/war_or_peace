class Turn
    attr_reader :player1, :player2, :spoils_of_war, :type
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
       if player1.deck1.rank_of_card_at(0) == player2.deck2.rank_of_card_at(0)
        :war 
       elsif player1.deck1.rank_of_card_at(0) && player1.deck1.rank_of_card_at(2) == player2.deck2.rank_of_card_at(0) && player2.deck2.rank_of_card_at(2)
        :mutually_assured_destruction
       else
        :basic
       end
    end



end


