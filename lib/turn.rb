class Turn
    
    attr_reader :player1, :player2, :spoils_of_war
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def turn_type
        p1_index_0 = player1.deck.rank_of_card_at(0)
        p2_index_0 = player2.deck.rank_of_card_at(0)
        p1_index_2 = player1.deck.rank_of_card_at(2)
        p2_index_2 = player2.deck.rank_of_card_at(2)

        if p1_index_0 == p2_index_0 && p1_index_2 == p2_index_2
             turn_type = :mutually_assured_destruction
        elsif p1_index_0 == p2_index_0  
            turn_type = :war
        elsif p1_index_0 != p2_index_0 
            turn_type = :basic
        end

        turn_type
    end
end

# turn_type = @player1 <=> @player2 #need to write methods to call in instance variables
