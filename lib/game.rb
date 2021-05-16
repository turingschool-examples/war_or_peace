class = Game
    def initialize
        @turn = 0
    end

    def in_progress?
    end

    def start
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
            while @turn < 10000
                if (player1.deck.cards.size == 0) || (player1.deck.cards.size == 0)
                end
            end
        end
    end
end