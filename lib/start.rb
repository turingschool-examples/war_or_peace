class Start

    def initialize
        @cards = cards
        @deck = deck

    def main_menu
        puts "Welcome to War! (or Peace) This game will be played with 52 cards."
        puts "The players today are Megan and Aurora"
        puts "Type 'GO' to start the game!"
        puts "------------------------------------------------------------------"

        response = gets.chomp

        if response == "GO"
            start_game
        else puts "Wrong command. Try typing GO"
            quit
        end 
    end

    def start_game
        @card.suit = [:diamond, :heart, :spade, :club]
        @card.value = [1..52]
        @card.rank = [1..13]

        @card.suit.sample
        @card.value.sample
        @card.rank.sample

                
    end
end

