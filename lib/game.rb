require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class Game
    attr_reader :player1, :player2, :unshuffled_deck, :deck1, :deck2, :turn_counter
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @unshuffled_deck = []
        @deck1 = []
        @deck2 = []
        @turn_counter = 0
    end

    def set_up_deck 
        @unshuffled_deck == game.cards
    end


    # def start
    #     p "Welcome to War! (or Peace) This game will be played with 52 cards.
    #     The players today are Megan and Aurora.
    #     Type 'GO' to start the game!
    #     ------------------------------------------------------------------"
    #     loop do
    #         response = gets.chomp 
    #             if response == "GO"
    #                 split_deck 
    #                 takes_turn
    #                 break 
    #             else
    #                 p 'okay!'
    #             end
    #         end
    #     end

    # end

    # def takes_turn
    #     if @turn = :mutually_assured_destruction
    #         p ---- DRAW ----
    #         p "*~*~*~* Aurora has won the game! *~*~*~*"
    #     else
    # end

end
