class Game

    attr_reader :player_1,
                :player_2
                

    def initialize (player_1, player_2)

        @player_1 = player_1
        @player_2 = player_2
        

    end

    def welcome_message
        print "\nWelcome to War (or Peace)! This game will be played with 52 cards.\nThe players today are #{@player_1.player_name} and #{@player_2.player_name}.\nType 'GO' to start the game!\n ------------------------------------------------------------------\n" 
    end


    def start

        welcome_message

        que = gets.chomp

       if que != "GO"

        welcome_message

       else

        i = 0

        turns = []

        loop do

            turns << Turn.new(@player_1, @player_2)

            if turns[i].winner == @player_1
                print "\nTurn #{i+1}: #{@player_1.player_name} won"
            elsif turns[i].winner == @player_2
                print "\nTurn #{i+1}: #{@player_2.player_name} won"
            else
                print "\nTurn #{i+1}: no winner"
            end

            i += 1

            if @player_2.deck.cards.empty?

                print "\n*~*~*~* #{@player_1.player_name} has won the game! *~*~*~*"
                
                break

            elsif @player_1.deck.cards.empty?

                print "\n*~*~*~* #{@player_2.player_name} has won the game! *~*~*~*"
                
                break

            elsif i == 100

                print "---- DRAW ----"

                break
            end

        end


    end

    

    
    
    
    end

end