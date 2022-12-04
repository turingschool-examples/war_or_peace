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
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
    puts

    # Need to accept user input
        pl_answer = gets.chomp
    
    # Need to add conditionals if user types "GO" or something else
    # and tell code what to do. 
        if pl_answer == "GO" || pl_answer == "go" || pl_answer == "Go" || pl_answer == "gO"
            # commence
            puts "test worked"
        else
            puts 
            puts "Didn't catch that, please try again:"
            puts
            start
        end
    end

    # 2def "commence game"
    #telling code how to operate the game
    # loop -> make 1,000,000 turns || turn until (( has_lost? = true )) aka empty array
    # you'll need ruby user input
    # if there is still no winner after 1,000,000 turns
        #puts "no winner" and as if want to play again(code should be in next method)
    # end

    #3def Who's the winner? of the entire game...
    # #option to play again?
    # print question play again? 
    # user input (get) if yes 
    #                     start
    #                 else terminate game
    #                         put "bye"
    #                 end 
end

    # OLD CODE FOR: Need to distribute 26 cards to each deck 
    # This old code nested too many arrays inside of arrays but led to what is currently written. 
        # p1_cards = []
        # p1_cards << @full_deck.take(26)
        # 26.times do
        #   full_deck.shift
        # end
        # p2_cards = []
        # p2_cards << @full_deck.take(26)
        # 26.times do
        #   full_deck.shift
        # end