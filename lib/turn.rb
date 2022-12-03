class Turn
   attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def basic 
        player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
    end

    def war
        player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
    end

    def mutually_assured_destruction
        player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
    end

    def type
        if basic
            :basic
        elsif war
            :war
        elsif mutually_assured_destruction
            :mutually_assured_destruction
        end
    end
    
    def winner
       if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
            player1 
       elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
            player2
       end
    end
    
    def pile_cards
        @spoils_of_war << player1.deck.cards.shift  
        @spoils_of_war << player2.deck.cards.shift
    end

    def award_spoils(winner)
        winner.deck.cards << @spoils_of_war
        winner.deck.cards.flatten!
        @spoils_of_war = []
        #require 'pry'; binding.pry
    end
end