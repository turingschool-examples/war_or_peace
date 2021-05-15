class Turn
    attr_reader :player1, :player2, :spoils_of_war, :winner

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        @winner
    end 

    def type
        if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
           type = :basic
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
            type = :war
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            type  = :mutually_assured_destruction
        end
    end 

    def winner
        if type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                @winner = player1 
            elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
                @winner = player2
            end 

        elsif type == :war
            if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                @winner = player1
            elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
                @winner = player2
            end 

        elsif type == :mutually_assured_destruction
            p "No Winner"  
        end
    end

    def pile_cards
        if type == :basic
            spoils_of_war << player1.deck.cards.shift
            spoils_of_war << player2.deck.cards.shift
        end 

        if type == :war
            player1.deck.cards.shift(3).each do |card|
                spoils_of_war << card
            end
            player2.deck.cards.shift(3).each do |card|
                spoils_of_war << card
            end 
        end 

        if type == :mutually_assured_destruction
            player1.deck.cards.shift(3).each do |card|
                spoils_of_war << card
            end 
            player2.deck.cards.shift(3).each do |card|
                spoils_of_war << card
            end 
        end 
    end 


end 