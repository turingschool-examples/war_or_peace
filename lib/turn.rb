class Turn
    attr_reader :spoils_of_war, :player1, :player2
    def initialize(player1, player2)
        @player2 = player2
        @player1 = player1
        @spoils_of_war = []
    end
end