require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

class Game
    attr_reader :turn,
                :value2
    def initialize(turn)
        @turn = turn
        @go = ""
    end

    def start
        input = ''
        puts "Welcome to War! (or Peace) This game will be played with #{turn.player1.deck.cards.length + turn.player2.deck.cards.length} cards."
        puts "The players today are #{turn.player1.name} and #{turn.player2.name}."
        puts "Type 'GO' to start the game!"
        puts "------------------------------------------------------------------"
        puts ""
        input = gets.chomp.upcase

        if input == 'GO'
            puts ""
            puts "------------------------------------------------------------------"
            game_go
        else
            puts ""
            puts "------------------------------------------------------------------"
            puts "Okay. Maybe another time!"
            puts ""
            exit
        end
    end

    def game_go
        puts""
        puts "TEST"
    end
end