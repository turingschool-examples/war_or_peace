
class Turn
    attr_reader :player1, :player2

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
    end

    def type basic
        player1.deck.rank_of_card_at(0) || player2.deck.rank_of_card_at(0)
    end

end 
        