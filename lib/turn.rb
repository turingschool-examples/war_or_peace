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
        if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && (@player1.deck.cards.length < 3 || @player2.deck.cards.length < 3)
            return :draw if @player1.deck.cards.length == @player2.deck.cards.length
            return :game_over
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            return :mutually_assured_destruction
        elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) 
            return :basic
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            return :war
        end
    end

    def winner
        if type == :basic
            return @player1 if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            return @player2
        elsif type == :war
            return @player1 if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
            return @player2
        elsif type == :game_over
            return @player1 if @player2.deck.cards[2] == nil
            return @player2
        elsif type == :draw
            return "Draw"
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
        elsif type == :game_over
            3.times { @spoils_of_war << @player1.deck.remove_card}
            3.times { @spoils_of_war << @player2.deck.remove_card}
            @spoils_of_war.compact!
        end

        @spoils_of_war
    end

    def shuffle_spoils
        @spoils_of_war = @spoils_of_war.shuffle
    end

    def award_spoils(winning_player)
        @spoils_of_war.each { |card| winning_player.deck.add_card(card)} if winning_player != "No Winner"
    end
end