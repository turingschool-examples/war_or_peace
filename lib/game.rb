require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'



class Game

    attr_reader :player_1,
                :player_2
                

    def initialize 

        rank_values = [2, 3, 4, 5, 6, 7, 8, 9, 10]

        diamonds = []
        hearts = []
        spades = []
        clubs = []

        full_deck_cards = []


        rank_values.each do |rank_value|

            diamonds << Card.new(:diamond, "#{rank_value}", rank_value)

            hearts << Card.new(:heart, "#{rank_value}", rank_value)

            spades << Card.new(:spade, "#{rank_value}", rank_value)

            clubs << Card.new(:club, "#{rank_value}", rank_value)
            
        end

        def create_high_value(suits, suit)

            suits << Card.new(suit, "Jack", 11)
            suits << Card.new(suit, "Queen", 12)
            suits << Card.new(suit, "King", 13)
            suits << Card.new(suit, "Ace", 14)

        end

        create_high_value(diamonds, :diamond)
        create_high_value(hearts, :heart)
        create_high_value(spades, :spade)
        create_high_value(clubs, :club)


        full_deck_cards = diamonds + hearts + spades + clubs
        full_deck_cards = full_deck_cards.shuffle
        half_deck_1 = []
        half_deck_2 = []


        26.times do
            half_deck_1 << full_deck_cards.shift
        end

        26.times do
            half_deck_2 << full_deck_cards.shift
        end

        deck_1 = Deck.new(half_deck_1)
        deck_2 = Deck.new(half_deck_2)



        @player1 = Player.new("Mufasa", deck_1)
        @player2 = Player.new("Skar", deck_2)
        

    end

    def welcome_message
        print "\nWelcome to War (or Peace)! This game will be played with 52 cards.\nThe players today are #{@player1.name} and #{@player2.name}.\nType 'GO' to start the game!\n ------------------------------------------------------------------\n" 
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


        welcome_loop


        i = 0

        turns = []

        loop do

            turns << Turn.new(@player1, @player2)


            if turns[i].winner == @player1
                print "\nTurn #{i+1}: #{@player1.name} won. "
            elsif turns[i].winner == @player2
                print "\nTurn #{i+1}: #{@player2.name} won."
            else
                print "\nTurn #{i+1}: no winner"
            end

            #print "\n\n#{turns[i].type}\n\n" ------> For testing purposes


            turns[i].pile_cards
    
    
            # print "\n#{turns[i].player1.name}  #{turns[i].player1.deck.cards} \n"
            # print "\n#{turns[i].player2.name}  #{turns[i].player2.deck.cards} \n"
            #this code was for testing and troubleshooting purposes. 


            if @player2.has_lost?

                print "\n*~*~*~* #{@player1.name} has won the game! *~*~*~*"
                
                break

            elsif @player1.has_lost?

                print "\n*~*~*~* #{@player2.name} has won the game! *~*~*~*"
                
                break

            elsif i == 1000000

                print "\n---- DRAW ----\n"

                break
            end


            #print "\n\n #{turns[i].spoils_of_war} \n\n" ------> for testing purposes

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