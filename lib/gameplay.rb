class GamePlay
    attr_reader :player1, :player2, :turns

    attr_accessor :current_turn_type, :current_turn_winner

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @turns = []
        @current_turn_type = :basic
        @current_turn_winner = ''
    end

    def start
        
        if @player1.deck.cards.size != 0 && @player2.deck.cards.size != 0 && self.turns.length < 1000000
            self.new_turn
            self.turn_result
        else self.winner
        end
       
    end

    #this method will run a turn in entirety
    def new_turn
        new_turn = Turn.new(@player1, @player2)
        @turns << new_turn
        @current_turn_type = new_turn.type
        @current_turn_winner = new_turn.winner
        new_turn.pile_cards
        new_turn.award_spoils(@current_turn_winner)
    end

    #this method will determine a turn result
    def turn_result
        if @current_turn_type == :basic
            p "#{current_turn_winner.name} won 2 cards. Player1: #{self.player1.deck.cards.size} cards Player2:#{self.player2.deck.cards.size} cards"
        elsif @current_turn_type == :war
            p "WAR - #{current_turn_winner.name} won 6 cards. Player1: #{self.player1.deck.cards.size} cards Player2:#{self.player2.deck.cards.size} cards"
        elsif @current_turn_type == :mutually_assured_destruction
            p "**mUtuAlLy asSUreD dEsTrUctIOn** 6 cards REMOVED from play.  Player1: #{self.player1.deck.cards.size} cards Player2:#{self.player2.deck.cards.size} cards"
        end
        
    end

    #this method will determine a game winner
    def winner
        if @player1.deck.cards.size == 52
            p "*~*~*~* #{@player1.name} has conquered all! *~*~*~*" 
        elsif @player2.deck.cards.size == 52
            p "*~*~*~* #{@player2.name} has conquered all! *~*~*~*"
        else
            p "---- DRAW; PEACE IS AMONG US ----"
        end
    end





end









###old stuff


# def start
#     1000000.times do
#         if @player1.deck.cards.size != 0 && @player2.deck.cards.size != 0
#             new_turn = Turn.new(@player1, @player2)
#             @turns << new_turn
#             # require 'pry'; binding.pry
#             # new_turn.type
#             # winner = new_turn.winner
#             # new_turn.pile_cards
#             # new_turn.award_spoils(winner)
#             # if new_turn.type == :mutually_assured_destruction
#             #     p "**mUtuAlLy asSUreD dEsTrUctIOn** 6 cards REMOVED from play"
#             # else
#             #     if new_turn.type == :war
#             #         p "WAR - #{winner.name} won 6 cards"
#             #     elsif new_turn.type == :basic
#             #         p "#{winner.name} won 2 cards"
#             #     end
#             # end
#         end
#         # require 'pry'; binding.pry
#     end  
    
#     # if @player1.deck.cards.size == 52
#     #     p "*~*~*~* #{@player1.name} has conquered all! *~*~*~*" 
#     # elsif @player2.deck.cards.size == 52
#     #     p "*~*~*~* #{@player2.name} has conquered all! *~*~*~*"
#     # else
#     #     p "---- DRAW; PEACE IS AMONG US ----"
#     # end
# end

 # def winner
    #     if @player1.deck.cards.size == 52
    #         p "*~*~*~* #{@player1.name} has conquered all! *~*~*~*" 
    #     elsif @player2.deck.cards.size == 52
    #         p "*~*~*~* #{@player2.name} has conquered all! *~*~*~*"
    #     else
    #         p "---- DRAW; PEACE IS AMONG US ----"
    #     end
    # end