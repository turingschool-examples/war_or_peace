require './lib/turn'

class Start 
    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @counter = 1
    end

    def start_game
        puts "Type 'GO' to start the game!\n"
        game = gets.chomp
        "------------------------------------------------------------------"
        until game.downcase == 'go' 
            puts 'Invalid Input, try again'
            game = gets.chomp
        end 
        greeting
    end
    
    def greeting
        puts "Welcome to War! (or Peace) This game will be played with 52 cards.\n"+
        "The players today are #{@player1.name} and #{@player2.name}.\n"
        new_round
    end 

    def new_round
        turn = Turn.new(@player1,@player2)
        until @player1.has_lost? || @player2.has_lost? || @counter == 1000000 do
        # until @counter == 10 do # placeholder for conditional
            if turn.type == :basic
                puts "Turn #{@counter}: #{turn.winner.name} won 2 cards"
                # return "#{turn.winner.name} won 2 cards"
            elsif turn.type == :war
                puts "Turn #{@counter}: WAR - #{turn.winner.name} won 6 cards"
                # return "#{turn.winner.name} won 6 cards"
            else
                puts "*mutually assured destruction* 6 cards removed from play"  
                # return "*mutually assured destruction* 6 cards removed from play"  
            end
            @counter += 1
            turn.pile_cards
        end 
        if @counter < 1000000 && !turn.winner.has_lost?
            puts "Turn #{@counter}: #{turn.winner.name} won the game!" # not correct, needs to check who is the over all winner
        else
            puts '-------DRAW-------'
        end 
    end 
end 