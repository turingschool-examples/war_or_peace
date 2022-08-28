require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'




class GameAlternative

    attr_reader :player1,
                :player2,
                :deck1,
                :deck2

    def initialize 

        file_name = "lib/cards.txt"

       
        cardgen= CardGenerator.new(file_name)

        deck_1 = cardgen.deck1
        deck_2 = cardgen.deck2

        
        @player1 = Player.new("Mufasa", deck_1)
        @player2 = Player.new("Skar", deck_2)
        

    end





    # def create_high_value(suits, suit)

    #     suits << Card.new(suit, "Jack", 11)
    #     suits << Card.new(suit, "Queen", 12)
    #     suits << Card.new(suit, "King", 13)
    #     suits << Card.new(suit, "Ace", 14)

    # end






    # def create_decks

    #     rank_values = [2, 3, 4, 5, 6, 7, 8, 9, 10]

    #     diamonds = []
    #     hearts = []
    #     spades = []
    #     clubs = []

    #     full_deck_cards = []


    #     rank_values.each do |rank_value|

    #         diamonds << Card.new(:diamond, "#{rank_value}", rank_value)

    #         hearts << Card.new(:heart, "#{rank_value}", rank_value)

    #         spades << Card.new(:spade, "#{rank_value}", rank_value)

    #         clubs << Card.new(:club, "#{rank_value}", rank_value)
            
    #     end


    #     create_high_value(diamonds, :diamond)
    #     create_high_value(hearts, :heart)
    #     create_high_value(spades, :spade)
    #     create_high_value(clubs, :club)


    #     full_deck_cards = diamonds + hearts + spades + clubs
    #     full_deck_cards = full_deck_cards.shuffle
    #     half_deck_1 = []
    #     half_deck_2 = []


    #     26.times do
    #     half_deck_1 << full_deck_cards.shift
    #     end

    #     26.times do
    #     half_deck_2 << full_deck_cards.shift
    #     end

    #     @deck1 = Deck.new(half_deck_1)
    #     @deck2 = Deck.new(half_deck_2)

    # end





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


            if turns[i].type == :basic

                if turns[i].winner == @player1
                    print "\nTurn #{i+1}: #{@player1.name} won. #{@player1.name} has won 2 cards"
                elsif turns[i].winner == @player2
                    print "\nTurn #{i+1}: #{@player2.name} won. #{@player2.name} has won 2 cards"
                end

            elsif turns[i].type == :war
                if turns[i].winner == @player1
                    print "\nTurn #{i+1}: WAR - #{@player1.name} won 6 cards"
                elsif turns[i].winner == @player2
                    print "\nTurn #{i+1}: WAR - #{@player2.name} won 6 cards"
                end

            else
                print "\nTurn #{i+1}: *mutually assured destruction* 6 cards removed from play."
            end

            #print "\n\n#{turns[i].type}\n\n" ------> For testing purposes


            turns[i].pile_cards
    
    
            # print "\n#{turns[i].player1.name}  #{turns[i].player1.deck.cards} \n"
            # print "\n#{turns[i].player2.name}  #{turns[i].player2.deck.cards} \n"
            #this code was for testing and troubleshooting purposes. 


            if @player2.has_lost?

                print "\n*~*~*~* #{@player1.name} has won the game! *~*~*~*\n"
                
                break

            elsif @player1.has_lost?

                print "\n*~*~*~* #{@player2.name} has won the game! *~*~*~*\n"
                
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