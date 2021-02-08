class Turn
    attr_reader :spoils_of_war, :player1, :player2, :winner_of_game, :turn_type, :turn_count
    def initialize(player1, player2)
        @player2 = player2
        @player1 = player1
        @spoils_of_war = []
        @turn_type = self.type
        @winner = self.winner
        @turn_count = false
    end

    def type
        if @player1.deck.cards[-1].rank != @player2.deck.cards[-1].rank
            return @turn_type = :basic
        elsif [@player1.deck.cards.length,@player2.deck.cards.length].min < 4
            if [@player1.deck.cards.length,@player2.deck.cards.length].min < 3
                return @turn_type = :game_over
            elsif [@player1.deck.cards.length,@player2.deck.cards.length].min == 3
                if @player1.deck.cards[-3].rank == @player2.deck.cards[-3].rank
                    if @player1.deck.cards.length == @player2.deck.cards.length
                        return @turn_type = :draw
                    else
                        return @turn_type = :mad
                    end
                else
                    return @turn_type = :war
                end
            end
        elsif @player1.deck.cards[-3].rank == @player2.deck.cards[-3].rank
                return @turn_type = :mad 

        end
    end

    def winner
        turn_type = @turn_type
        if @turn_count == true
            return @winner_of_game
        elsif turn_type == :basic
            return @winner_of_game = @player1.deck.cards[-1].rank.to_i > @player2.deck.cards[-1].rank.to_i ? @player1 : @player2
        elsif turn_type == :war
            return @winner_of_game = @player1.deck.cards[-3].rank.to_i > @player2.deck.cards[-3].rank.to_i ? @player1 : @player2
        elsif turn_type == :game_over
            return @winner_of_game
        elsif turn_type == :draw
            return @winner_of_game
        else
            return @winner_of_game = 'No Winner'
        end
    end

    def pile_cards
        @winner = self.winner
        if @winner != 'No Winner'
            @turn_count = true
            if @turn_type == :war
                @spoils_of_war.concat(@player1.deck.cards.pop(3) + @player2.deck.cards.pop(3))
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

    def turn_counter
        @turn_count = !@turn_count
    end

    def award_spoils 
        self.winner
        if @spoils_of_war != []
            @spoils_of_war.concat(@winner.deck.cards)
            @winner.deck.cards.clear
            @winner.deck.cards.concat(@spoils_of_war)
            self.turn_counter
            @spoils_of_war.clear
            return 
        else
            return nil
        end
    end
end