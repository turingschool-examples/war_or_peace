class Game
    attr_reader :turns

    def initialize
        @turns = 0
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
        @turns += 1
        print 'Turn #{@turn}: '
    end

    def print_winner
        if Turn.type == :basic
            p '#{turn.winner.name} won 2 cards'
        elsif Turn.type == :war
            p 'WAR - #{turn.winner.name} won 6 cards'
        else
            p '*mutually assured destruction* 6 cards removed from play'
        end
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
        until @turns == 10000
        end
    end
end