

class Game
    attr_reader #something I guss

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
    end


    def start
        print "Welcome to War! (or Peace) This game will be played with 52 cards.\n
        The players today are Megan and Aurora.\n
        Type 'GO' to start the game!\n
        ------------------------------------------------------------------"
    end

# user types go, and game starts

    if gets.chomp == "GO"
        # then start that game
    end
end
