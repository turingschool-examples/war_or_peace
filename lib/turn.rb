class Turn
    attr_reader :spoils_of_war, :player1, :player2, :winner, :turn_type, :winner_of_game
    def initialize(player1, player2)
        @player2 = player2
        @player1 = player1
        @spoils_of_war = []
        @turn_type = self.type
        @winner = self.winner
        @turn_count = 0
    end
    def type
        if [@player1.deck.cards.length,@player2.deck.cards.length].min < 1
            return @turn_type = 'game over'
        elsif @player1.deck.cards[-1].rank != @player2.deck.cards[-1].rank
            return @turn_type = :basic
        elsif [@player1.deck.cards.length,@player2.deck.cards.length].min < 4
            if [@player1.deck.cards.length,@player2.deck.cards.length].min < 3
                return @turn_type = 'gg'
            elsif [@player1.deck.cards.length,@player2.deck.cards.length].min == 3
                if @player1.deck.cards[-3].rank == @player2.deck.cards[-3].rank
                    return @turn_type = 'gg'
                else
                    return @turn_type = :war
                end
            end
        else 
            if @player1.deck.cards[-3] == @player2.deck.cards[-3]
                return @turn_type = :mad
            else
                return @turn_type = :war
            end
        end
    end
    def winner
        p @winner
        if @turn_count == 1
            return @winner_of_game
        elsif @turn_type == :basic
            return @winner_of_game = @player1.deck.cards[-1].rank > @player2.deck.cards[-1].rank ? @player1 : @player2
        elsif @turn_type == :war
            return @winner_of_game = @player1.deck.cards[-3].rank > @player2.deck.cards[-3].rank ? @player1 : @player2
        else
            return @winner_of_game = 'No Winner'
        end
    end
    def pile_cards
        self.winner
        @turn_count = 1
        if @winner != 'No Winner'
            if @turn_type == 'war'
                @spoils_of_war.concat(@player1.deck.cards.pop(3) + @player2.deck.cards.pop(3))
                p @spoils_of_war
                return @spoils_of_war
            else
                @spoils_of_war.concat(@player1.deck.cards.pop(1) + @player2.deck.cards.pop(1))
                return @spoils_of_war
            end
        else
            @player1.deck.cards.pop(3)
            @player2.deck.cards.pop(3)
            return 
        end
    end
    def award_spoils 
        self.winner
        if @spoils_of_war != []
            @spoils_of_war.concat(@winner_of_game.deck.cards)
            @winner_of_game.deck.cards.clear
            @winner_of_game.deck.cards.concat(@spoils_of_war)
            @turn_count = 0
            @spoils_of_war.clear
            return 
        else
            return nil
        end
    end
end