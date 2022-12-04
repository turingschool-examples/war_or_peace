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
        if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
            :war
        else player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)    
            :basic
        end
    end
    
    def winner
        if type == :mutually_assured_destruction
            "No Winner" 

        elsif type == :war     
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) 
                player1
            else
                player2
            end

        else type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) 
                player1
            else
                player2
            end
        
        end
    end

    def pile_cards
        garbage = []
        # probably going to need to reshuffle these cards
        # then evenly distribute them to bottom of each players deck 
        # if the game is going to continue running.

        if type == :mutually_assured_destruction
            3.times do
                garbage << (player1.deck.remove_card)
                garbage << (player2.deck.remove_card)
            end

        elsif type == :war  
            3.times do
                spoils_of_war << (player1.deck.remove_card)
                spoils_of_war << (player2.deck.remove_card)
            end

        else type == :basic
            spoils_of_war << player1.deck.remove_card
            spoils_of_war << player2.deck.remove_card
  
        end
    end

    def award_spoils(winner)
        winner.deck.cards.concat(spoils_of_war) 

        if type == :war    
            6.times do
                spoils_of_war.shift
            end
        else type == :basic
            2.times do
                spoils_of_war.shift
            end
        end
        # until <has_lost? = []>
        # need to add .shuffle!
    end

end
