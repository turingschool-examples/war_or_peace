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
        if 
            @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            :basic
        elsif
            @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction 
        else 
            @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            :war
        end
    end

    def winner
        if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            player1
        elsif 
            @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
            player2
        elsif
            @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
            player1
        elsif
            @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
            player2
        else
            @type == :mutually_assured_destruction
            "No winner"
        end
    end

    def pile_cards
        if type == :basic
            # require 'pry';binding.pry
           @spoils_of_war << @player1.deck.remove_card
           @spoils_of_war << @player2.deck.remove_card
        elsif type == :war
            @spoils_of_war << @player1.deck(0) 
            @player1.deck(2)
            @player2.deck(0)
            @player2.deck(2)
        else
            @spoils_of_war << @player1.deck(0) && @player1.deck(2) && @player2.deck(0) && @player2.deck(2)
        end
    end

    def award_spoils
        
    end
end