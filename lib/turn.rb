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
        if mutually_assured_destruction
            :mutually_assured_destruction
        elsif war
            :war
        else basic
            :basic
        end
    end

    def basic
        player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
    end

    def war
        player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
    end

    def mutually_assured_destruction
        player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
    end


    def winner
        if turn.type :basic
            player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
            return player1
        else
            return player2

        if turn.type :war
            player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
            return player1
        else
            return player2

        if turn.type :mutually_assured_destruction
            return "No Winner"
        end
    end

    def pile_cards
        if turn.type :basic
            
        end
    end
    
end