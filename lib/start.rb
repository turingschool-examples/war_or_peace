require 'pry'
class Start
    # attr_reader :start
    def initialize
    end

    def welcome_message 
p "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
    start_game
    end

    def start_game
        start = gets.chomp.upcase
         if start == "GO"
            # p "Lets play!"
        else
            p "Please try again. Enter GO to start the game, or anything else to exit."
            start = gets.chomp.upcase
                if start == "GO"
                    # p "Good choice, lets play!"
                else
                    p "GOODBYE!"
                    exit
                end
        end                   
    end
end
