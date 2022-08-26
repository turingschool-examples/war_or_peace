class Turn
    attr_reader :player1, :player2, :spoils_of_war
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            :basic
        elsif @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        else :war
        end
    end

    def winner
        if type == :basic
            return @player1 if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            @player2
        elsif type == :war
            return @player1 if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
            @player2
        elsif type == :mutually_assured_destruction
            return "No Winner"
        end
    end

    def pile_cards
        if type == :basic
            players = [@player1, @player2]
            players.each do |card|
                @spoils_of_war << card.deck.cards.shift
            end
        elsif type == :war
            players = [@player1, @player2]
            3.times do
                players.each do |card|
                    @spoils_of_war << card.deck.cards.shift
            end
        end
        elsif type == :mutually_assured_destruction
            players = [@player1, @player2]
            3.times do
                players.each do |card|
                    card.deck.cards.shift
            end
        end        
        end
    end

    def award_spoils_of_war(winner)
        (winner.deck.cards << spoils_of_war).flatten!
        @spoils_of_war = []
    end
end