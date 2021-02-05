class Turn
    attr_reader :spoils_of_war, :player1, :player2
    def initialize(player1, player2)
        @player2 = player2
        @player1 = player1
        @spoils_of_war = []
        @type = ''
    end
    def type
        if [@player1.deck.cards[-1],@player2.deck.cards[-1]].min < 2
            return 'game over'
        elsif @player1.deck.cards[-1] != @player2.deck.cards[-1]
            @type = 'basic'
        elsif [@player1.deck.cards[-1].length,@player2.deck.cards[-1].length].min < 4
            if [@player1.deck.cards[-1].length,@player2.deck.cards[-1].length].min < 3
                @type = 'gg'
            elsif [@player1.deck.cards[-1].length,@player2.deck.cards[-1].length].min == 3
                if @player1.deck.cards[-3] == @player2.deck.cards[-3]
                    @type = 'gg'
                else
                    @type = 'war'
                end
            end
        else 
            if @player1.deck.cards[-3] == @player2.deck.cards[-3]
                @type = 'mad'
            else
                @type = 'war'
            end
        end
    end
end