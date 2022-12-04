require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
    # attr_reader :full_deck

    def initialize(full_deck)
        @full_deck = full_deck
        #@full_deck.??? (shuffle) randomized new card decks
        #@Deck1 - 26cards each
        #@deck2 - 26cards each
        #@player 1 << ("name", deck1)
        #@player 2 << ("name", deck2)
       # @turn = Turn.new(player1, player2)
    end

    #1def start

    # puts 
    # Welcome to War! (or Peace) This game will be played with 52 cards.
    # The players today are Megan and Aurora.
    # Type 'GO' to start the game!
    # ------------------------------------------------------------------
    # if press "GO" game run

    #else
    #invalid input
    #puts "cant understand. try again."
    #return main screen with "GO" instructions

    #end

    # 2def "commence game"
    #telling code how to operate the game
    # you'll need ruby user input

    # end

    #3def Who's the winner? 
    #option to play again?

end
