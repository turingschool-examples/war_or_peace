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



end