class Game 
    attr_reader :player1,
                :player2,
                :turn_count

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @turn_count = 1
    end

    def game_ended?
        return true if @player1.deck.cards.length == 0 || @player2.deck.cards.length == 0
        return false
    end

    def play_turn
        turn = Turn.new(@player1, @player2)
        
        winner = turn.winner
        turn.pile_cards
        num_spoils = turn.spoils_of_war.count
        turn.award_spoils(winner).class

        puts "Turn #{turn_count}: #{winner.name} won #{num_spoils} cards"
    end

    def start
        play_turn

        until game_ended? == true || @turn_count == 1_000_000
            play_turn
        end

        
    end

end