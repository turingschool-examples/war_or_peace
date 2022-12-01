class Turn

    attr_reader :player1,
    :player2,
    :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        @type = :basic
    end

    def type 
        if @player1.deck.cards.first != @player2.deck.cards.first
            @type = :basic
        end
    end

    def winner 
    
        if @type == :basic && @player1.deck.cards.first.rank >  @player2.deck.cards.first.rank
            winner = @player1
        elsif @type == :basic && @player2.deck.cards.first.rank >  @player1.deck.cards.first.rank
            winner = @player2
        end

    end



end