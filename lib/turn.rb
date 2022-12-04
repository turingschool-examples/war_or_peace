
class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    # def basic if
    #     player1.deck.cards.size <=2 || @player2.deck.size <=2
    # end

end