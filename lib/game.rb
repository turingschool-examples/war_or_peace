class Game 
    attr_reader :player1,
                :player2 

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
    end

    def game_ended?(player)
        return true if player.deck.cards.length == 0
        return false
    end

    def play_turn
        turn = Turn.new(@player1, @player2)
        winner = turn.winner

        turn.pile_cards
        turn.award_spoils(winner)
    end
end