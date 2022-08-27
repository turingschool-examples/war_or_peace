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
        if type == :mutually_assured_destruction
            "No Winner"
        elsif type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                player1
            else
                player2    
            end    
        else type == :war 
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                player1
            else
                player2
            end
        end
    end

    def pile_cards 
        if type == :basic 
            spoils_of_war << player1.deck.remove_card
            spoils_of_war << player2.deck.remove_card
        # elsif type == :war
        #     spoils_of_war << deck.card.shift(3)
        end
    end
end