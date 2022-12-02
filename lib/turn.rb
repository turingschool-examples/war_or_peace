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
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            :war
        else
            :basic
        end
    end

    def winner
        if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
            player1
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
            player2
        else
            "No Winner"
        end
    end

    def pile_cards
       if type == :basic 
        # each player will send one card (the top card) to the spoils pile
        # spoils << cards (2)
            spoils_of_war << player1.deck.cards.shift
            spoils_of_war << player2.deck.cards.shift
       elsif type == :war
        # each player will send three cards (the top three cards) to the spoils pile
        # spoils << cards (6)
        3.times do
            spoils_of_war << player1.deck.remove_card
            spoils_of_war << player2.deck.remove_card
        end
       else type == :mutually_assured_destruction
        # each player will remove three cards from play (the top three cards in their deck). These cards are not sent to the spoils pile, they are simply removed from each players’ deck.
        # remove card method? = no cards to spoils
        3.times do
            player1.deck.remove_card
            player2.deck.remove_card
        end
       end
    end

    def award_spoils(winner)
        if winner != "No Winner"
            @spoils_of_war.each do |card|
                winner.deck.add_card(card)
            end
        end
    end
end
