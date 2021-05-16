class Game
    attr_reader :turn

    def initialize
        @turn = 0
    end

    def welcome
        puts "Welcome to War! (or Peace) This game will be played with 52 cards."
        puts "Welcome to War! (or Peace) This game will be played with 52 cards."
        puts "The players today are Megan and Aurora."
        puts "Type 'GO' to start the game!"
        puts '------------------------------------------------------------------'
        print '> '
        response = gets.chomp
        if response != GO
            puts "I see... Perhaps another time, then."
        else
            puts "Then let's begin!"
        end
    end

    def start
        game.welcome
    end
end