require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Turn
    attr_reader :player1, 
                :player2, 
                :spoils_of_war, 
                :type,
                :winner,
                :deck,
                :cards
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        @type = type
    end

    def type 
        if (@player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3) && (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
            :mutual_destruction
        elsif (@player1.deck.cards.count == 2 || @player2.deck.cards.count == 2) && (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(1) == player2.deck.rank_of_card_at(1))
            :two_card_stalemate
        elsif (@player1.deck.cards.count == 1 || @player2.deck.cards.count == 1) && (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0))
            :one_card_stalemate
        elsif (@player1.deck.cards.count == 2 || @player2.deck.cards.count == 2) && (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(1) != player2.deck.rank_of_card_at(1))
            :short_war
        elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2))
            :war
        else
            :basic
        end
    end

            # if (@player1.deck.cards.count() == 3 || @player2.deck.cards.count() == 3) && (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
        #     :three_card_stalemate

    def winner
        if @type == :basic
            if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
                @player1
            else
                @player2 
            end
        elsif @type == :war
            if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
                @player1
            else
                @player2
            end
        elsif @type == :short_war
            if @player1.deck.rank_of_card_at(1) > @player2.deck.rank_of_card_at(1)
                @player1
            else
                @player2
            end
        elsif @type == :three_card_stalemate || @type == :two_card_stalemate || @type == :one_card_stalemate
            if @player1.deck.cards.count > @player2.deck.cards.count()
                @player1
            else 
                @player2
            end
        elsif @type == :mutual_destruction
            "No Winner"
        end
    end

    def pile_cards
        if type == :basic
            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card
        elsif type == :war
            3.times do
                @spoils_of_war << player1.deck.remove_card
                @spoils_of_war << player2.deck.remove_card
            end
        elsif type == :short_war
            2.times do
                @spoils_of_war << player1.deck.remove_card
                @spoils_of_war << player2.deck.remove_card
            end
                
        elsif type == :mutual_destruction
            3.times do
                player1.deck.remove_card
                player2.deck.remove_card
            end
        elsif type == :two_card_stalemate
            2.times do
                player1.deck.remove_card
                player2.deck.remove_card
            end
        elsif type == :one_card_stalemate
            player1.deck.remove_card
            player2.deck.remove_card
        end
    end

    def award_spoils(winner)
        winner.deck.add_card(spoils_of_war.shuffle!.shift) until spoils_of_war.count == 0
    end
end