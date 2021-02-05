class Turn
    attr_reader :spoils_of_war, :player1, :player2
    def initialize(player1, player2)
        @player2 = player2
        @player1 = player1
        @spoils_of_war = []
    end
    def type
        if [@player1.deck.cards.length,@player2.deck.cards.length].min < 2
            return 'game over'
        elsif @player1.deck.cards[-1].rank != @player2.deck.cards[-1].rank
            return'basic'
        elsif [@player1.deck.cards.length,@player2.deck.cards.length].min < 4
            if [@player1.deck.cards.length,@player2.deck.cards.length].min < 3
                return 'gg'
            elsif [@player1.deck.cards.length,@player2.deck.cards.length].min == 3
                if @player1.deck.cards[-3].rank == @player2.deck.cards[-3].rank
                    return 'gg'
                else
                    return 'war'
                end
            end
        else 
            if @player1.deck.cards[-3] == @player2.deck.cards[-3]
                return 'mad'
            else
                return 'war'
            end
        end
    end
    def winner
        if self.type == 'basic'
            return @player1.deck.cards[-1].rank > @player2.deck.cards[-1].rank ? @player1.name : @player2.name
        elsif self.type == 'war'
            return @player1.deck.cards[-3].rank > @player2.deck.cards[-3].rank ? @player1.name : @player2.name
        elsif self.type == 'mad'
            return 'No Winner'
        end
    end
    def pile_cards
        if self.winner != 'No Winner'
            if self.type == 'war'
                @spoils_of_war.concat([@player1.deck.cards.pop(3), @player2.deck.cards.pop(3)])
            else
                @spoils_of_war.concat([@player1.deck.cards.pop, @player2.deck.cards.pop])
            end
        end
    end
end