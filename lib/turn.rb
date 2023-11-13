class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if basic_type
            :basic
        elsif war_type
            :war
        else mutually_assured_destruction_type
            :mutually_assured_destruction
        end
    end

    def basic_type
        @player1.deck.cards.first.rank != @player2.deck.cards.first.rank && @player1.deck.cards[2].rank != @player2.deck.cards[2].rank
    end

    def war_type
        @player1.deck.cards.first.rank == @player2.deck.cards.first.rank && @player1.deck.cards[2].rank != @player2.deck.cards[2].rank
    end

    def mutually_assured_destruction_type
        @player1.deck.cards.first.rank == @player2.deck.cards.first.rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
        puts "No Winner"
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
        if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
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
            mutually_assured_destruction_spoils_pile
        end
    end

    def basic_spoils_pile    
        @spoils_of_war << player1.deck.cards.first
        @spoils_of_war << player2.deck.cards.first
        @player1.deck.cards.shift
        @player2.deck.cards.shift
    end

    def war_spoils_pile
        3.times do
            @spoils_of_war << player1.deck.cards.first
            @spoils_of_war << player2.deck.cards.first
            @player1.deck.cards.shift
            @player2.deck.cards.shift 
        end
    end

    def mutually_assured_destruction_spoils_pile
        3.times do
            @player1.deck.cards.shift
            @player2.deck.cards.shift
        end
    end

    def award_spoils(winner)

        if winner == @player1
            @spoils_of_war.map do |card|
                @player1.deck.cards << card
            end
        else
            @spoils_of_war.map do |card|
                @player2.deck.cards << card
            end
        end
    end
end
