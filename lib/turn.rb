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
        :basic if player1.cards[0] != player2.cards[0]
    end
end