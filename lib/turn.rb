class Turn
    attr_reader :player1, :player2, :spoils_of_war, :winner

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        # @winner = nil
    end

    def type
        if (player1.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2)) == (player2.deck.rank_of_card_at(0) && player2.deck.rank_of_card_at(2))
            return :mutually_assured_destruction
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            return :war
        else
            :basic
        end
    end

    def winner
        if type == :basic
            if @player1.deck.cards[0].rank > player2.deck.cards[0].rank
                return @player1
            else
                return @player2

            end
        elsif type == :war
            if player1.deck.cards[2].rank > player2.deck.cards[2].rank
                # @winner = player1
                return @player1
            else
                # @winner = player2
                return @player2
            end
        else
            return 'No Winner'
        end
    end

    def pile_cards
        if type == :basic
            @spoils_of_war << @player1.deck.cards.shift
            @spoils_of_war << @player2.deck.cards.shift
        elsif type == :war
            3.times {@spoils_of_war << @player1.deck.cards.shift}
            3.times {@spoils_of_war << @player2.deck.cards.shift}
        elsif type == :mutually_assured_destruction
            # require 'pry'; binding.pry
            (@player1.deck.cards).replace(@player1.deck.cards.drop(3))
            (@player2.deck.cards).replace(@player2.deck.cards.drop(3))
        end
    end

    def award_spoils(winner)
        if winner == @player1
            (@player1.deck.cards).concat(@spoils_of_war)
            @spoils_of_war.clear
            return @player1.deck.cards
        elsif winner == @player2
            (@player2.deck.cards).concat(@spoils_of_war)
            @spoils_of_war.clear
            return @player2.deck.cards
        end
    end
end