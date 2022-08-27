class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2 
        @spoils_of_war = []
    end

    def type
        if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            :basic
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            :war
        else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        end
    end

    def winner 
        if :mutually_assured_destruction
            "No Winner"
        elsif :basic
            basic_winner
        else :war 
            war_winner
        end
    end

    def basic_winner
        if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
            player1
        else
            player2    
        end
    end

    def war_winner
        if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
            player1
        else
            player2
        end
    end




end