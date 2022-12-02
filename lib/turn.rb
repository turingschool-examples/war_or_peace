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
        if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank 
            return :basic
        elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
            return :war
        end
    end

    def winner
        if type == :basic
            return @player1 if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
            return @player2
        elsif type == :war
            return @player1 if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
            return @player2
        end
    end

    def pile_cards
        if type == :basic
            @spoils_of_war << @player1.deck.cards.shift
            @spoils_of_war << @player2.deck.cards.shift
        elsif type == :war
            @spoils_of_war << @player1.deck.cards.shift(3)
            @spoils_of_war << @player2.deck.cards.shift(3)
        end

        @spoils_of_war = @spoils_of_war.flatten
    end

    def award_spoils(winner)
        require "pry"; binding.pry
            winner_pile = winner.deck.cards
            winner.deck.cards = winner_pile.flatten
    end
end