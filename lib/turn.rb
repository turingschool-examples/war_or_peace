require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

     def type
         if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            if player1.deck.cards[2] == nil || player2.deck.cards[2] == nil
                if player1.deck.cards[2] == nil && player2.deck.cards[2] == nil
                    @type = :game_over_draw
                elsif player1.deck.cards[2] == nil
                    @type = :game_over_player2_wins
                elsif player2.deck.cards[2] == nil
                    @type = :game_over_player1_wins
                end
            elsif player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
                @type = :mutually_assured_destruction
            else
                @type = :war
            end
         else
            @type = :basic
        end
    end

     def winner
        if @type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                return player1
            else
                return player2
            end
        elsif @type == :war
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                return player1
            else
                return player2
            end
        elsif @type == :mutually_assured_destruction
            return "No Winner"
        elsif @type == :game_over_draw
            return "No Winner"
            require "pry"; binding.pry
        elsif @type == :game_over_player1_wins
            return player1
            require "pry"; binding.pry
        elsif @type == :game_over_player2_wins
            return player2
            require "pry"; binding.pry
        end
    end

     def pile_cards
        if @type == :basic
            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card
        elsif @type == :war
            3.times do
                @spoils_of_war << player1.deck.remove_card
                @spoils_of_war << player2.deck.remove_card
            end
        elsif @type == :mutually_assured_destruction
            3.times do
                player1.deck.remove_card
                player2.deck.remove_card
            end
        elsif @type == :game_over_draw
            player1.deck.cards.clear
            player2.deck.cards.clear
        elsif @type == :game_over_player1_wins
                player2.deck.cards.clear
        elsif @type == :game_over_player2_wins
            player1.deck.cards.clear
        end
    end
    
    def award_spoils(winning_player)
        @spoils_of_war.each do |card| card 
            winning_player.deck.add_card(card)
        end
        @spoils_of_war.clear
    end
end