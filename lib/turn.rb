class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war
                # :type

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        # @type = :basic
    end

    def mutually_assured_destruction
        player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        
    end

    def war
        player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
        
    end

    def basic
        player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) || player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
        
    end

    def type
        if mutually_assured_destruction
          :mutually_assured_destruction
        elsif war
          :war
        else
          :basic
        end
    end

    def winner
    
        
    end
 
    def pile_cards
        
        @spoils_of_war << player1.deck.cards[0]
        @spoils_of_war << player2.deck.cards[0]
        player1.deck.remove_card
        player2.deck.remove_card
        
    end

    def award_spoils(winner)
        # require "pry"; binding.pry
        winner.deck.cards.concat(@spoils_of_war)
        
    end


end
