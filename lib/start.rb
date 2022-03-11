require './lib/turn'

class Start 
    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
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
        first_round
    end 

    def first_round
        until @player1.deck.cards.empty? || @player2.deck.cards.empty? do
            turn = Turn.new(@player1,@player2)
            if turn.type == :basic
                puts "#{turn.winner.name} won 2 cards"
                return "#{turn.winner.name} won 2 cards"
            elsif turn.type == :war
                puts "#{turn.winner.name} won 6 cards"
                return "#{turn.winner.name} won 6 cards"
            else
                puts "*mutually assured destruction* 6 cards removed from play"  
                return "*mutually assured destruction* 6 cards removed from play"  
            end  
        end 
    end 
end 