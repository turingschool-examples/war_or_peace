require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

class Game
    attr_reader :turn

    def initialize(turn)
        @turn = turn
        @go = ""
        turn.player1.deck.shuffle
        turn.player2.deck.shuffle
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
            if turn.type == :basic
                winner = turn.winner
                turn.pile_cards
                i += 1
                turn.award_spoils(winner)
                puts "Turn #{i}: #{winner.name} won 2 cards"
                turn.player1.deck.shuffle
                turn.player2.deck.shuffle
            elsif turn.type == :war
                winner = turn.winner
                turn.pile_cards
                i += 1
                turn.award_spoils(winner)
                puts "Turn #{i}: #{winner.name} won 2 cards"
                turn.player1.deck.shuffle
                turn.player2.deck.shuffle
            elsif turn.type == :mutually_assured_destruction
                i += 1
                puts "Turn #{i}: *mutually assured destruction* 6 cards removed from play"
                turn.player1.deck.shuffle
                turn.player2.deck.shuffle
            elsif turn.type == :game_over_draw
                turn.pile_cards
                i += 1
                puts "Turn #{i}: *Neither player has a third card*"
            elsif turn.type == :game_over_player1_wins
                turn.pile_cards
                i += 1
                puts "Turn #{i}: *#{turn.player2.name} does not have a third card."
            elsif turn.type == :game_over_player2_wins
                turn.pile_cards
                i += 1
                puts "Turn #{i}: *#{turn.player1.name} does not have a third card."
            else
                puts "ERROR: What did you do?"
                break
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