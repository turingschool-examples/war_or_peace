class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if basic_turn
            :basic
        elsif war_turn
            :war
        else
            :mutually_assured_destruction
        end
    end

    def basic_turn
        @player1.deck.cards.first.rank != @player2.deck.cards.first.rank

    end

    def war_turn
        @player1.deck.cards.first.rank == @player2.deck.cards.first.rank
    end

    def winner
        if type == :basic
            basic_turn_winner
        elsif type == :war
            war_turn_winner 
        else type == :mutually_assured_destruction
            puts "No Winner"           
        end
    end

    def basic_turn_winner
        if @player1.deck.cards.first.rank > @player2.deck.cards.first.rank
            @player1
        else
            @player2
        end
    end

    def war_turn_winner
        if @player1.deck.cards.second.rank > @player2.deck.cards.second.rank
            @player1
        else
            @player2
        end
    end

    def pile_cards
        if type == :basic
            basic_spoils_pile
        elsif type == :war
            war_spoils_pile
        else type == :mutually_assured_destruction
            mad_spoils_pile
        end
    end

    def basic_spoils_pile
        @spoils_of_war.concat([@player1.deck.cards.first, @player2.deck.cards.first])
        @player1.deck.cards.first.delete_at(1)
        @player2.deck.cards.first.delete_at(1)
    end

    def war_spoils_pile
        3.times.do
        @spoils_of_war.concat([@player1.deck.cards.first, @player2.deck.cards.first])
        @player1.deck.cards.first.delete_at(1)
        @player2.deck.cards.first.delete_at(1)
    end

    def mad_spoils_pile
        3.times.do
        @player1.deck.cards.first.delete
        @player2.deck.cards.first.delete
    end



end