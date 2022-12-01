class Turn

    attr_reader :player1,
    :player2,
    :spoils_of_war,
    :type

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        @type = :basic
    end

    def type 
        if @player1.deck.cards.first.rank != @player2.deck.cards.first.rank
            @type = :basic
        elsif @player1.deck.cards.first.rank == @player2.deck.cards.first.rank  && @player1.deck.cards[2].rank != @player2.deck.cards[2].rank#have only played 1 card each
            @type = :war
        elsif @player1.deck.cards.first.rank == @player2.deck.cards.first.rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
            @type = :mutually_assured_destruction
        end
    end

    def winner 
    
        if @type == :basic && @player1.deck.cards.first.rank >  @player2.deck.cards.first.rank
            winner = @player1
        elsif @type == :basic && @player2.deck.cards.first.rank >  @player1.deck.cards.first.rank
            winner = @player2
        elsif @type == :war && @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
            winner = @player1
        elsif @type == :war && @player2.deck.cards[2].rank > @player1.deck.cards[2].rank
            winner = @player2
        elsif @type == :mutually_assured_destruction
            winner = "No Winner"
        end

    end

    def pile_cards
        if @type == :basic
            @spoils_of_war << @player1.deck.remove_card
            @spoils_of_war << @player2.deck.remove_card
        elsif @type == :war
            @spoils_of_war << @player1.deck.remove_card
            @spoils_of_war << @player1.deck.remove_card
            @spoils_of_war << @player1.deck.remove_card
            @spoils_of_war << @player2.deck.remove_card
            @spoils_of_war << @player2.deck.remove_card
            @spoils_of_war << @player2.deck.remove_card

        end
       
    end

    def award_spoils(winner)
        winner.deck.cards.concat(@spoils_of_war)
    end
end