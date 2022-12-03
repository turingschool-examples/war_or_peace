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
        if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
            return :mutually_assured_destruction
        elsif @player1.deck.cards[0].rank != @player2.deck.cards[0].rank 
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
        return "No Winner"
    end

    def pile_cards
        if type == :basic
            @spoils_of_war << @player1.deck.remove_card
            @spoils_of_war << @player2.deck.remove_card
        elsif type == :war
            3.times { @spoils_of_war << @player1.deck.remove_card}
            3.times { @spoils_of_war << @player2.deck.remove_card}
        elsif type == :mutually_assured_destruction
            3.times { @player1.deck.remove_card}
            3.times { @player2.deck.remove_card}
        end

        @spoils_of_war = @spoils_of_war.flatten
    end

    def award_spoils(winning_player)
        winning_player.deck.cards.concat(spoils_of_war)
    end
end