class Turn

    attr  :player1,
          :player2,
          :spoils_of_war,
          :basic,
          :war,
          :mutually_assured_destruction

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        @basic = basic
        @war = war
        @mutually_assured_destruction

    end

    def type
        if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
            :basic

        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            :war

        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        end
    end

    def winner
        
        if type == :basic 

            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                player1 

            else player2

            end
        

        elsif type == :war

            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                 player1

            else player2

            end
        

        elsif type == :mutually_assured_destruction

             "No winner"

        end
    end


    def pile_cards

        if type == :basic
            
            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card

        elsif type == :war

            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card

        elsif type == :mutually_assured_destruction

            player1.deck.remove_card
            player1.deck.remove_card
            player1.deck.remove_card
            player2.deck.remove_card
            player2.deck.remove_card
            player2.deck.remove_card
            
        end
    end
end