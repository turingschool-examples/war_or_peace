class Game
    attr_reader :turn

    def initialize
        @turn = 0
    end

    def welcome
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are Megan and Aurora."
        p "Type 'GO' to start the game!"
        p '------------------------------------------------------------------'
    end

    def turn_counter
        @turn += 1
        print 'Turn #{@turn}: '
    end

    def start
        game.welcome
        print '> '
        response = gets.chomp
        if response != GO
            p "I see... Perhaps another time, then."
        else
            p "Then let's begin!"
        end
        until @turn == 10000
            
    end
end