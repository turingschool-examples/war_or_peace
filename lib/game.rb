require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
    attr_reader :full_deck,
                :deck1,
                :deck2,
                :player1,
                :player2

    def initialize(full_deck)
    # Need to randomize cards in the full deck
        @full_deck = full_deck.shuffle
        
    # Need to distribute 26 cards to each deck 
        @deck1 = Deck.new(@full_deck.take(26))  
        @deck2 = Deck.new(@full_deck.last(26)) 
            52.times do
                full_deck.shift
            end

    # Need to give each player a name & deck 
        @player1 = Player.new("Megan", @deck1)    
        @player2 = Player.new("Aurora", @deck2)  
    
    # Need to allow each player to take a turn 
        @turn = Turn.new(@player1, @player2)
       
    end

    def start
    # Need to show welcome screen and instructions/ability for user to start game
    puts
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!" 
    puts "------------------------------------------------------------------"
    puts

    # Need to accept user input
        user_response = gets.chomp.upcase
    
    # Need to add conditionals if user types "GO" or something else
    # and tell code what to do. 
        if user_response == "GO" 
            commence
            # puts "test worked"
        else
            puts 
            puts "Didn't catch that, please try again:"
            puts
            start
        end
    end

    def commence
    # Need to tell code how to operate the turns of the game over and over until there's a loser        
        counter = 0

        until player1.has_lost? || player2.has_lost? || counter == 1_000_000
            counter += 1

            if turn == :mutually_assured_destruction
                        puts "Turn #{counter}: *mutually assured destruction* 6 cards removed from play"
            elsif turn == :war
                        puts "Turn #{counter}: WAR - #{winner.name} has won 6 cards"
            else turn == :basic
                        puts "Turn #{counter}: #{winner.name} has won 2 cards"
            end

        end 
    end

    # Need to show who won the entire game
    def champion
    
        if player1.has_lost?
            puts
            puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
            
        elsif player2.has_lost?
            puts
            puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"

        else counter == 1_000_000
            puts
            puts "---- DRAW ----\n"
        # Need an option to play again or terminate game
            puts "Type 'GO' to start another game."
            puts "------------------------------------------------------------------\n"
            user_response = gets.chomp.upcase
              if user_response == "GO" 
                  commence
              else
                  puts "See ya next time!"
              end
        end
        
        start

    end

end
    
# OLD CODE:
    
    # This worked but the .upcase method is cleaner:
    # <if user_response == "GO" || user_response == "go" || user_response == "Go" || user_response == "gO">

    # This worked but nested too many arrays inside of arrays but led to what is currently written. 
        #< 
        #p1_cards = []
        # p1_cards << @full_deck.take(26)
        # 26.times do
        #   full_deck.shift
        # end
        # p2_cards = []
        # p2_cards << @full_deck.take(26)
        # 26.times do
        #   full_deck.shift
        # end
        #>