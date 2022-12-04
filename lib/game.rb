class Game

    def initialize(cards)
        #require 'pry'; binding.pry
        @cards = cards.shuffle!
        @deck1 = Deck.new(@cards[0..25])
        @deck2 = Deck.new(@cards[26..51])
        @player1 = Player.new("Caleb", @deck1)
        @player2 = Player.new("Joslyn", @deck2)
        @turn = Turn.new(@player1, @player2)

    end

    def start
        p "Welcome to War! (or Peace) This game will be played with 52 cards." 
        p "The players today are Caleb and Joslyn. Type 'GO' to start the game!"
        p "------------------------------------------------------------------"

        if gets.chomp.upcase == "GO"
            run_game
        else
            start
        end
    end
    

    def run_game
        count = 0 
        
        until count == 1_000_000 || @player1.has_lost? || @player2.has_lost?
            type = @turn.type
            winner = @turn.winner
            @turn.pile_cards
            count += 1
            if type == :basic
                @turn.award_spoils(winner)
                puts "Turn #{count}: BASIC - #{winner.name} won 2 cards."
            elsif type == :war
                @turn.award_spoils(winner)
                puts "Turn #{count}: WAR - #{winner.name} won 6 cards."
            elsif type == :mutually_assured_destruction
                puts "Turn #{count}: *mutually assured destruction* 6 cards removed from play"
            end

            check_winner(count)
        end
    end

    def check_winner(count)
        if @player1.has_lost? == true 
           puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        elsif @player2.has_lost? == true
           puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        elsif count == 1_000_000
            require 'pry'; binding.pry   
           puts "---- DRAW ----"
                
        end
    end
    


end