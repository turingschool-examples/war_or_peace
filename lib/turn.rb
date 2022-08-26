require 'pry'
require_relative './card'
require_relative './deck'
require_relative './player'


class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            return :basic
        elsif @player1.deck.cards[2] == nil || @player2.deck.cards[2] == nil
            return :redo
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            return :mutually_assured_destruction 
        else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            return :war
        end 
    end 

    #I added a redo turn type in this because I was receiving error messages when one player had < 3 cards and a war turn got called.
    #I made up a rule that if there weren't enough cards to execute a war turn, both players put the top card on the bottom 
    #of their deck and resume play like normal. 

    def winner 
        if type == :redo
            return 'redo'
        elsif type == :mutually_assured_destruction
            return 'No winner'
        elsif type == :war
            return [@player1, @player2].max_by { |player| player.deck.rank_of_card_at(2) }
        else
            return [@player1, @player2].max_by { |player| player.deck.rank_of_card_at(0) }
        end 
    end 

    def pile_cards
        if type == :redo
            return [@player1, @player2].each { |player| player.deck.top_card_to_bottom }
        elsif type == :basic
            return [@player1, @player2].each { |player| @spoils_of_war << player.deck.remove_card } 
        elsif type == :war
            return [@player1, @player2].each { |player| 3.times { @spoils_of_war << player.deck.remove_card } } 
        else 
            return [@player1, @player2].each { |player| 3.times { player.deck.remove_card } }
        end 
    end 

    def award_spoils(winner)
        return if winner == 'No winner' || winner == 'redo'
        @spoils_of_war.shuffle.each { |spoil| winner.deck.cards << spoil }
        #shuffling spoils makes it so there are no longer infinite games
    end 
end 