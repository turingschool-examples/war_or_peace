

class Game
    attr_reader #something I guess

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
    end


    def start
        print "Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are Megan and Aurora.\nType 'GO' to start the game!\n------------------------------------------------------------------"
    end

# user types go, and game starts

    if gets.chomp == "GO"
        # then start that game
    end
end
