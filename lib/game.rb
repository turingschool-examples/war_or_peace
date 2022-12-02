class Game 
    def initialize(game)
        @game = game

    end

    def start
        input = gets.chomp
        p intro_message
    end

    def intro_message
        if input.upcase = "GO!"
        p "Welcome to War! (or Peace) This game will be played with 52 cards.
        The players today are #{player1.name} and #{player2.name}.
        Type 'GO' to start the game!
        ------------------------------------------------------------------"
        else
            p "Would you like to play a game?"
        end
    end
end