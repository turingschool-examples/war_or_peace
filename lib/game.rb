require './lib/deck'
require './lib/player'
require './lib/turn'
# require 'pry'

class Game
    attr_accessor :cards, :deck1, :deck2, :player1, :player2, :turn, :start

    def initialize(cards)
        @cards = cards.shuffle
        @deck1 = Deck.new(@cards[0..25])
        @deck2 = Deck.new(@cards[26..51])
        @player1 = Player.new("Joe", @deck1)
        @player2 = Player.new("Jess", @deck2)
        @turn = Turn.new(@player1, @player2)
    end

    def start
        # binding.pry
       p "Welcome to War! (or Peace) This game will be played with 52 cards."
       p "The players today are #{player1.name} and #{player2.name}."
       p "Type 'GO' to start the game!"
       p "------------------------------------------------------------------"

       message = gets.chomp.upcase
         if message == "GO"
           begin_game
         else
            start
        end
    end

    def begin_game
        turn_num = 0

        until turn_num == 1_000_000 || (@player1.has_lost? == true || @player2.has_lost? == true)
            type = @turn.type
            winner = @turn.winner
            @turn.pile_cards
            turn_num +=1
            if type == :basic
                @turn.award_spoils(winner)
                puts "Turn #{turn_num}: #{winner.name} won 2 cards"
            elsif type == :war
                @turn.award_spoils(winner)
                puts "Turn #{turn_num}: WAR - #{winner.name} has won 6 cards"
            elsif type == :mutually_assured_destruction
                puts "Turn #{turn_num}: *mutually assured destruction* 6 cards removed from play"
            end
            
            check_winner(turn_num)
        end
    end

    def check_winner(turn_num)
        if @player1.has_lost? == true
            puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        elsif @player2.has_lost? == true
            puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        elsif turn_num == 1_000_000 
            puts "---- DRAW ----"
        end
    end

end