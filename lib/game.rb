require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

class Game
    attr_reader :turn

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
        i = 0
        puts""
        until turn.player1.has_lost? || turn.player2.has_lost? || i >= 1000000
            i += 1
            if turn.type == :basic
                if turn.winner == turn.player1
                    puts "Turn #{i}: #{turn.player1.name} won 2 cards"
                    turn.pile_cards
                    turn.award_spoils(turn.player1)
                else
                    puts "Turn #{i}: #{turn.player2.name} won 2 cards"
                    turn.pile_cards
                    turn.award_spoils(turn.player2)
                end
            elsif turn.type == :war
                if turn.winner == turn.player1
                    puts "Turn #{i}: WAR - #{turn.player1.name} won 6 cards"
                    turn.pile_cards
                    turn.award_spoils(turn.player1)
                else
                    puts "Turn #{i}: WAR - #{turn.player2.name} won 6 cards"
                    turn.pile_cards
                    turn.award_spoils(turn.player2)
                end
            elsif turn.type == :mutually_assured_destruction
                puts "Turn #{i}: *mutually assured destruction* 6 cards removed from play"
                turn.pile_cards
                turn.award_spoils(turn.player1)
            else
                puts "ERROR: What did you do?"
            end
        end
        if turn.player1.has_lost?
            puts "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
        elsif turn.player2.has_lost?
            puts "*~*~*~* #{turn.player1.name} has won the game! *~*~*~*"
        elsif i >= 1000000
            puts "---- DRAW ----"
        end
    end
end