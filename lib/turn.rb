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
        if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            p :war
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            p :mutually_assured_destruction
        else
            p :basic
        end
    end

    def winner
        if :war
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                player1.winner == true
            else
                player2.winner == true
            end
        
        elsif :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                player1.winner == true
            else
                player2.winner == true
            end

        else
            p "No Winner"
            
        end
    end

    def pile_cards
        if :war
            3.times do
                spoils_of_war << player1.deck.remove_card
            end
            3.times do
                spoils_of_war << player2.deck.remove_card
            end
        
        elsif :basic
            spoils_of_war << player1.deck.remove_card 
            spoils_of_war << player2.deck.remove_card

        else
            3.times do 
                player1.deck.remove_card
            end
            3.times do
                player2.deck.remove_card
            end

        end
    end

    def award_spoils(winner)
        
    end
end