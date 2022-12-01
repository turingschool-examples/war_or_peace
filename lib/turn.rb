class Turn 
    attr_reader :player1,
                :player2,
                :spoils_of_war
    def initialize (player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if player1.deck.cards[0].rank != player2.deck.cards[0].rank then :basic
        elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank then :mutually_assured_destruction
        elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank then :war
        end
    end

    def winner
        if type == :basic then 
            if player1.deck.cards[0].rank > player2.deck.cards[0].rank then player1
        else player2
        end 
    elsif type == :war then
        if player1.deck.cards[2].rank > player2.deck.cards[2].rank then player1
        else player2
        end 
    end 
    end

    def pile_cards
        if type == :basic then
            spoils_of_war << player1.deck.cards.shift
            spoils_of_war << player2.deck.cards.shift
        elsif type == :war then
            spoils_of_war.concat(player1.deck.cards.shift(3))
            spoils_of_war.concat(player2.deck.cards.shift(3))
        end
    end

    def award_spoils(winner)
            winner.deck.cards.concat(spoils_of_war)
    end 
end