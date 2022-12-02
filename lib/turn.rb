class Turn
    attr_reader :player1, :player2, :spoils_of_war
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []

    end

    def type
        if @player1.deck.rank_of_cards_at(0) == @player2.deck.rank_of_cards_at(0) && @player1.deck.rank_of_cards_at(2) == @player2.deck.rank_of_cards_at(2)
            :mutually_assured_destruction
        elsif @player1.deck.rank_of_cards_at(0) == @player2.deck.rank_of_cards_at(0)
            :war
        else @player1.deck.rank_of_cards_at(0) != @player2.deck.rank_of_cards_at(0)
            :basic
        end
    end
        
    
    def winner
        if @player1.deck.rank_of_cards_at(0) == @player2.deck.rank_of_cards_at(0) && @player1.deck.rank_of_cards_at(2) == @player2.deck.rank_of_cards_at(2)
            "No Winner"
        elsif @player1.deck.rank_of_cards_at(0) == @player2.deck.rank_of_cards_at(0) && @player1.deck.rank_of_cards_at(2) > @player2.deck.rank_of_cards_at(0)
            player1
        else @player1.deck.rank_of_cards_at(0) > @player2.deck.rank_of_cards_at(0)
            player1
        end
    end

    def pile_cards
        
    end

    

        
    
    



end