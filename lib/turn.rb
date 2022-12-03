class Turn
    attr_reader :player1, :player2, :spoils_of_war
    
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        # require 'pry'; binding.pry
        @spoils_of_war = []
       
    end

    # def type
    #     :basic
    #     player1 rank_of_card_at(0) != player2 rank_of_card_at(0)
    # end
end

