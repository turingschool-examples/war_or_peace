class Game 
    attr_reader :player1,
                :player2,
                :turn_count,
                :turn_type

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @turn_count = 0
        @turn_type = :start
    end

    def game_ended?
        return true if @player1.has_lost? || @player2.has_lost?
        return false
    end

    def play_turn
        turn = Turn.new(@player1, @player2)
        @turn_count += 1
        winner = turn.winner
        @turn_type = turn.type

        turn.pile_cards
        turn.shuffle_spoils
        turn.award_spoils(winner)
        puts announce_winner(winner)

        winner
    end

    def start
        until game_ended? || @turn_count == 1_000_000
            winner = play_turn 
        end

        if @turn_count == 1_000_000
            return "---- DRAW ----"
        elsif winner == "No Winner"
            if @player1.deck.cards.count > @player1.deck.cards.count
                return "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
            else
                return "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
            end  
        else 
            return "*~*~*~* #{winner.name} has won the game! *~*~*~*"
        end
    end

    def announce_winner(winner)
        if @turn_type == :basic
            "Turn #{@turn_count}: #{winner.name} won 2 cards"
        elsif @turn_type == :war
            "Turn #{@turn_count}: WAR - #{winner.name} won 6 cards"
        elsif @turn_type == :mutually_assured_destruction
            "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
        end
    end
end