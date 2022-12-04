class Turn 

    attr_reader :player1, 
                :player2, 
                :spoils_of_war
    def initialize (player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if player1.deck.cards_arr[0].rank == player2.deck.cards_arr[0].rank && player1.deck.cards_arr[2].rank == player2.deck.cards_arr[2].rank
            :mutually_assured_destruction
        elsif player1.deck.cards_arr[0].rank != player2.deck.cards_arr[0].rank
            :basic
        elsif player1.deck.cards_arr[0].rank == player2.deck.cards_arr[0].rank
            :war
        end
    end

    def winner
        if type == :basic
            if player1.deck.cards_arr[0].rank > player2.deck.cards_arr[0].rank
                winner = player1
            elsif player1.deck.cards_arr[0].rank < player2.deck.cards_arr[0].rank
                winner = player2
            end
        end
        
        if type == :war
            if player1.deck.cards_arr[2].rank > player2.deck.cards_arr[2].rank
                winner = player1
            elsif player1.deck.cards_arr[2].rank < player2.deck.cards_arr[2].rank
                winner = player2
            end
        end

        if type == :mutually_assured_destruction
            winner = 'No Winner'
        end

        winner
    end

    def pile_cards 
        if type == :mutually_assured_destruction
            player1.deck.cards_arr.shift(3)
            player2.deck.cards_arr.shift(3)
        elsif type == :war
            player1.deck.cards_arr.slice[2]

            # 3.times do
            #     player1.deck.remove_card
            #     player2.deck.remove_card
            # end
        end
    end
end
