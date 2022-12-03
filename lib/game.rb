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

       message = gets.chomp
         if message == "GO" || "go" || "gO" "Go"
           begin_game
         else
            start
        end
    end

    def begin_game
        turn_num = 0

        until turn_num == 1_000_000
            winner = @turn.winner
            @turn.pile_cards
            turn_num +=1
            type = @turn.type
            if type == :basic
                @turn.award_spoils(winner)
                p "Turn #{turn_num}: #{winner.name} won 2 cards"
            elsif type == :war
                @turn.award_spoils(winner)
                p "Turn #{turn_num}: WAR - #{winner.name} has won 6 cards"
            else 
                P "Turn #{turn_num}: *mutually assured destruction* 6 cards removed from play"
            end
            
            check_winner 
        end
    end

    def check_winner
        

    end

end