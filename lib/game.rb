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

    def user_input
        gets.chomp
    end

    def welcome_loop

        welcome_message

        loop do

            if user_input != "GO"

                welcome_message

            else

                break

            end
        
        end

    end


    def start

        #welcome_loop


        i = 0

        turns = []

        loop do

            turns << Turn.new(@player_1, @player_2)


            if turns[i].winner == @player_1
                print "\nTurn #{i+1}: #{@player_1.player_name} won. "
            elsif turns[i].winner == @player_2
                print "\nTurn #{i+1}: #{@player_2.player_name} won."
            else
                print "\nTurn #{i+1}: no winner"
            end

            print "\n\n#{turns[i].type}\n\n"


            turns[i].pile_cards
    
    
            print "\n#{turns[i].player1.player_name}  #{turns[i].player1.deck.cards} \n"
            print "\n#{turns[i].player2.player_name}  #{turns[i].player2.deck.cards} \n"


            if @player_2.has_lost?

                print "\n*~*~*~* #{@player_1.player_name} has won the game! *~*~*~*"
                
                break

            elsif @player_1.has_lost?

                print "\n*~*~*~* #{@player_2.player_name} has won the game! *~*~*~*"
                
                break

            elsif i == 1000000

                print "\n---- DRAW ----\n"

                break
            end


            print "\n\n #{turns[i].spoils_of_war} \n\n"

            turns[i].award_spoils

            

            #The greyed out section below helped me figure out the order I needed for checking if players have won or lost.

            # if player_1.deck.cards.length() < 3

            #     print "Stahp!"

            # elsif player_2.deck.cards.length() < 3

            #     print "Don't do it"
            # end

            i += 1


            
        end


    end

    

    
    
    
    

end