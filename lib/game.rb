require './deck'
require './player'
require './turn'

class Game
    def initialize(cards)
        @cards = cards.shuffle
        @deck1 = Deck.new(@cards[0..26])
        @deck2 = Deck.new(@cards[26..52])
        @player1 = Player.new("Megan", @deck1)
        @player2 = Player.new("Aurora", @deck2)
        @turn = Turn.new(@player1, @player2)
        @turn_count = 0
    end


    def start
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are Megan and Aurora."
        p "Type 'GO' to start the game!"
        p "------------------------------------------------------------------"
    
        user_input = gets.chomp
        if user_input != "GO"
            start
        end
        play_game
    end

    def play_game
        until @player1.has_lost? == true || @player2.has_lost? == true || @turn_count == 1_000_000
            type = @turn.type
            winner = @turn.winner
            @turn.pile_cards
            @turn_count += 1
            
            if type == :basic
                @turn.award_spoils(winner)
                puts "Turn #{@turn_count}: #{winner.name} won 2 cards"
                
            elsif type == :war
                @turn.award_spoils(winner)
                puts "Turn #{@turn_count}: WAR - #{winner.name} won 6 cards"

            elsif type == :mutually_assured_destruction
                puts "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
            end
        end
        finish
    end

    def finish
        if @turn_count == 1_000_000 
            puts "---- DRAW ----"
        else
            puts "*~*~*~* #{@turn.winner} has won the game! *~*~*~*"
        end
    end
end