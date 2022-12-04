require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
    # attr_reader :full_deck

    def initialize(full_deck)
        @full_deck = full_deck
        #@full_deck.??? (shuffle) randomized new card decks
        #  full_deck.shuffle??
    
        @deck1 = Deck.new([card1 ... card26])  
        @deck2 = Deck.new([card27 ... card52])

        @player1 = Player.new("Megan", deck1)    
        @player2 = Player.new("Aurora", deck2)  

        @turn = Turn.new(player1, player2)

    end

    # def shuffle??
    #     *randomize full deck array
    # end

    #1def start

        # puts 
        # Welcome to War! (or Peace) This game will be played with 52 cards.
        # The players today are Megan and Aurora.
        # Type 'GO' to start the game!
        # ------------------------------------------------------------------
        
        # if press "GO" game run
    # if "go"
    #     commence
    #     # look into method called get (accept user input)

    # else
    #     #invalid input
    #     #puts "cant understand. try again."
    #     #return main screen with "GO" instructions
        
    #     # puts 
    #     # Welcome to War! (or Peace) This game will be played with 52 cards.
    #     # The players today are Megan and Aurora.
    #     # Type 'GO' to start the game!
    #     # ------------------------------------------------------------------

    # end
    #end

    # 2def "commence game"
    #telling code how to operate the game
    # loop -> turn after turn until (( has_lost? = true )) aka empty array
    # you'll need ruby user input

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
