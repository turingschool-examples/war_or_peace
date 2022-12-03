class Game 
    attr_reader :player1,
                :player2 

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
    end

    def game_ended?(player)
        #require "pry"; binding.pry
        return true if player.deck.cards.length == 0
        return false
    end
end