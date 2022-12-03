class Turn
    
    attr_reader :player1, :player2
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def turn_type
        require 'pry'; binding.pry
        # turn_type = @player1 <=> @player2 #need to write methods to call in instance variables


    end
end