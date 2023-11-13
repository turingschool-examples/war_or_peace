class Game

    def initialize
        @cards = cards
        @deck = deck
    end

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
        @player1.card.suit = [:diamond, :heart, :spade, :club]
        @player1card.value = [1..52]
        @player1card.rank = [1..13]
        @player1card.suit.sample
        @player1card.value.sample
        @player1card.rank.sample

        @player2.card.suit = [:diamond, :heart, :spade, :club]
        @player2card.value = [1..52]
        @player2card.rank = [1..13]
        @player2card.suit.sample
        @player2card.value.sample
        @player2card.rank.sample


        
    end
end

