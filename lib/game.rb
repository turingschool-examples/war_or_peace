class Game 
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2

    end

    def start
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are Bob and Joe."
        p "Type 'GO' to start the game!"
        p "------------------------------------------------------------------"
        input = gets.chomp
    end

    def input
        if input.upcase == 'GO'
            run_game
        else
            p "Would you like to play a game?"
        end
    end

    def run_game
        turn = Turn.new(player1, player2) 



    end
end