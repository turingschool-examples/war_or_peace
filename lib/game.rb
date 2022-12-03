class Game 
    attr_reader :player1,
                :player2,
                :turn_count

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @turn_count = 0
    end

    def game_ended?
        return true if @player1.deck.cards.empty? || @player2.deck.cards.empty?
        return false
    end

    def play_turn
        turn = Turn.new(@player1, @player2)
        @turn_count += 1
        winner = turn.winner

        turn.pile_cards
        num_spoils = turn.spoils_of_war.count

        turn.award_spoils(winner)
        puts "Turn #{turn_count}: #{winner.name} won #{num_spoils} cards"

        winner
    end

    def start
        until game_ended? == true || @turn_count == 1_000#_000
            winner = play_turn
        end
        
        return "---- DRAW ----" if @turn_count == 1_000#_000
        return "*~*~*~* #{winner.name} has won the game! *~*~*~*"
    end

end