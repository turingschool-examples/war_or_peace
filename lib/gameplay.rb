class GamePlay
    attr_reader :player1, :player2, :turns

    attr_accessor :current_turn_type, :current_turn_winner

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @turns = 0
        @current_turn_type = :basic
        @current_turn_winner = ''
    end

    def start
        while player1.has_lost? == false && player2.has_lost? == false && self.turns < 1000000
            self.new_turn
            self.turn_result
        end

        self.game_winner

    end

    #this method will run a turn in entirety
    def new_turn

        new_turn = Turn.new(@player1, @player2)
        @turns += 1
        @current_turn_type = new_turn.type
        @current_turn_winner = new_turn.winner
        new_turn.pile_cards
        new_turn.award_spoils(@current_turn_winner)

    end

    #this method will determine a turn result
    def turn_result
        if @current_turn_type == :basic
            p "#{current_turn_winner.name} won 2 cards. Player1:#{self.player1.deck.cards.size} cards Player2:#{self.player2.deck.cards.size} cards"
        elsif @current_turn_type == :war
            p "x!x WAR x!x - #{current_turn_winner.name} won 6 cards. Player1:#{self.player1.deck.cards.size} cards Player2:#{self.player2.deck.cards.size} cards"
        elsif @current_turn_type == :mutually_assured_destruction
            p "**mUtuAlLy asSUreD dEsTrUctIOn** 6 cards REMOVED from game.  Player1:#{self.player1.deck.cards.size} cards Player2:#{self.player2.deck.cards.size} cards"
        elsif @current_turn_type == :mutually_assured_destruction_2
            p "**mUtuAlLy asSUreD dEsTrUctIOn** 2 cards REMOVED from game.  Player1:#{self.player1.deck.cards.size} cards Player2:#{self.player2.deck.cards.size} cards"
        end
        
    end

    #this method will determine a game winner
   
    def game_winner
        if @player1.deck.cards.size == 0
            p "*~*~*~* #{@player2.name} has conquered the Office! *~*~*~*" 
        elsif @player2.deck.cards.size == 0
            p "*~*~*~* #{@player1.name} has conquered the Office! *~*~*~*"
        else
            p "---- DRAW; PEACE IS AMONG US <3 (Dwight! No weapons!) ----"
        end
    end

end