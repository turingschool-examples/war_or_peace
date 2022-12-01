class Turn 
    attr_reader :player1, 
                :player2 
                # :spoils of war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2 
        @spoils_of_war = []
    end

    def spoils_of_war
        @spoils_of_war
    end
    
    def type
        if 
            @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            :basic
        elsif
            @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            :war
        else 
            @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        end
    end

    def winner
        if @turn == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            player1
            require 'pry';binding.pry

        elsif @turn == :basic && @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
            player2
        elsif
            @turn == :war &&
            @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
            player1
        elsif
            @turn == :war &&
            @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
            player2
        else
            @turn == :mutually_assured_destruction
            "No winner"
        end
    end

end