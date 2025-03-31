require './lib/player'
require './lib/deck'
require './lib/card'
require './lib/turn'

class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []

    end

    def type
        if player1.deck.rank_of_card_at(0)!=player2.deck.rank_of_card_at(0)
            return :basic
        elsif player1.deck.rank_of_card_at(2)!=player2.deck.rank_of_card_at(2)
            return :war
        else 
            return :mutually_assured_desruction
        end
    end

    # def turn_type
    #     if player1.deck.rank_of_card_at(0)!=player2.deck.rank_of_card_at(0)
    #         return :basic
    #     elsif player1.deck.rank_of_card_at(2)!=player2.deck.rank_of_card_at(2)
    #         return :war
    #     else 
    #         return :mutually_assured_desruction
    #     end
    # end
    

    def winner
        case type
        when :basic
            basic_winner
            
        when :war
            war_winner

        else 
            'No Winner'  
            remove_war_cards
        end
    end

    def basic_winner
       case player1.deck.rank_of_card_at(0)<=> player2.deck.rank_of_card_at(0)
       when 1
        player1
       when -1
        player2
       end
    end

    def war_winner
        case player1.deck.rank_of_card_at(2)<=> player2.deck.rank_of_card_at(2)
        when 1
        player1
        
        when -1
        player2
        
        end
    end

    def add_to_basic_spoils
        @spoils_of_war = []
        1.times do
            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card
        end
    end

    def add_to_war_spoils
        @spoils_of_war = []
        3.times do
            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card

        end

    end

    def remove_war_cards
        3.times do
            player1.deck.remove_card
            player2.deck.remove_card
        end
    end

    def award_spoils(winner)
        winner.deck.cards.<<(spoils_of_war)
        binding.pry
        end

    def pile_cards

        case type
        when :basic
            add_to_basic_spoils(winner)
        when :war
            add_to_war_spoils(winner)
        when :mutually_assured_desruction
           remove_war_cards
        end
    
    end

end