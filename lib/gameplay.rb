class GamePlay
    attr_reader :player1, :player2, :turns
    
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @turns = []
    end

    def start
        1000000.times do
            if @player1.deck.cards.size != 0 && @player2.deck.cards.size != 0
                new_turn = Turn.new(@player1, @player2)
                @turns << new_turn
                # require 'pry'; binding.pry
                new_turn.type
                winner = new_turn.winner
                new_turn.pile_cards
                new_turn.award_spoils(winner)
                if new_turn.type == :mutually_assured_destruction
                    p "**mUtuAlLy asSUreD dEsTrUctIOn** 6 cards REMOVED from play"
                else
                    if new_turn.type == :war
                        p "WAR - #{winner.name} won 6 cards"
                    elsif new_turn.type == :basic
                        p "#{winner.name} won 2 cards"
                    end
                end
            end
            # require 'pry'; binding.pry
        end  
        
        if @player1.deck.cards.size == 52
            p "*~*~*~* #{@player1.name} has conquered all! *~*~*~*" 
        elsif @player2.deck.cards.size == 52
            p "*~*~*~* #{@player2.name} has conquered all! *~*~*~*"
        else
            p "---- DRAW; PEACE IS AMONG US ----"
        end
    end

    # def winner
    #     if @player1.deck.cards.size == 52
    #         p "*~*~*~* #{@player1.name} has conquered all! *~*~*~*" 
    #     elsif @player2.deck.cards.size == 52
    #         p "*~*~*~* #{@player2.name} has conquered all! *~*~*~*"
    #     else
    #         p "---- DRAW; PEACE IS AMONG US ----"
    #     end
    # end

end