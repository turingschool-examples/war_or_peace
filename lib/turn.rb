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
        if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            return :mutually_assured_destruction 
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            return :war 
        else 
            return :basic
        end 
    end 

    def winner 
        if type == :mutually_assured_destruction
            return 'No winner'
        elsif type == :war
            return [@player1, @player2].max_by { |player| player.deck.rank_of_card_at(2) }
        else
            return [@player1, @player2].max_by { |player| player.deck.rank_of_card_at(0) }
        end 
    end 

    def pile_cards
        if type == :basic
            return [@player1, @player2].each { |player| @spoils_of_war << player.deck.remove_card } 
        elsif type == :war
            return [@player1, @player2].each { |player| 3.times { @spoils_of_war << player.deck.remove_card } } 
        else 
            return [@player1, @player2].each { |player| 3.times { player.deck.remove_card } }
        end 
    end 

    def award_spoils(winner)
        return if winner == 'No winner'
        @spoils_of_war.shuffle.each { |spoil| winner.deck.cards << spoil }
    end 
end 