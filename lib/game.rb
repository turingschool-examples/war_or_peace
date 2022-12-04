require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
    
    def initialize(cards)
        @cards = cards.shuffle
        @deck1 = Deck.new(@cards[0..25])
        @deck2 = Deck.new(@cards[0..51])
        @player1 = Player.new('Megan', @deck1)
        @player2 = Player.new('Aurora', @deck2)
        @turn = Turn.new(@player1, @player2)
    end

    def start
        puts "Welcome to War! (or Peace) This game will be played with 52 cards."
        puts "The players today are #{@player1.name} and #{@player2.name}."
        puts "Type 'GO' to start the game!"
        puts "------------------------------------------------------------------"
        
        user_input = gets.chomp.upcase
        if user_input == "GO"
            run_game
        else
            start
        end

    end
   
    def run_game
        counter = 0

        until counter == 1_000_000 || @player1.has_lost? || @player2.has_lost?
            type = @turn.type
            winner = @turn.winner
            @turn.pile_cards
            counter += 1
            if type == :basic
                @turn.award_spoils(winner)
                p "Turn #{counter}: #{winner.name} won 2 cards"
            elsif type == :war
                @turn.award_spoils(winner)
                p "Turn #{counter}: WAR - #{winner.name} won 6 cards"
            elsif type == :mutually_assured_destruction
                p "Turn #{counter}: *mutually assured destruction* 6 cards removed from play"
            end

            check_winner(counter)
        end
    end
    
    def check_winner(counter)
        if @player1.has_lost? == true
            puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        elsif @player2.has_lost? == true
            puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        elsif counter == 1_000_000
            puts "---- DRAW ----"
        end
    end  
end