require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
    attr_reader :player_1, :player_2 #:spoils_of_war
    def initialize(player1, player2) #spoils_of_war)
        @player_1 = player1
        @player_2 = player2
        # @spoils_of_war = spoils_of_war
    end
end