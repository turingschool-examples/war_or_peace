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
       
        if type == :basic
            @spoils_of_war << player1.deck.cards.shift
            @spoils_of_war << player2.deck.cards.shift
        elsif type == :war
            3.times do
                @spoils_of_war << player1.deck.remove_card
                @spoils_of_war << player2.deck.remove_card
            end
        else 
            3.times do
                @spoils_of_war << player1.deck.remove_card
                @spoils_of_war << player2.deck.remove_card
            end
        end
    end

    

    

        
    
    



end