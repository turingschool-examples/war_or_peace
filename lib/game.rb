class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "-" * 70

    input = $stdin.gets.chomp

    if input.upcase == 'GO'
      turn_count = 0
      while turn_count < 1000000 do
        turn_count += 1
        if turn_count == 1000001
          p "---- DRAW ----"
          return 'DRAW'
        else
          turn = Turn.new(@player1, @player2)
          type = turn.type
          winner = turn.winner
          # card1 = @player1.deck.cards[0]
          # card2 = @player2.deck.cards[0]
          turn.pile_cards

          if type == :basic
            turn.award_spoils(winner)
            p "Turn #{turn_count}: #{winner.name} won 2 cards." #(#{@player1.deck.cards.size} vs. #{@player2.deck.cards.size}) - (#{card1.value} #{card1.suit} vs. #{card2.value} #{card2.suit})"
          elsif type == :war
            turn.award_spoils(winner)
            p "Turn #{turn_count}: WAR - #{winner.name} won 6 cards" #(#{card1.value} vs. #{card2.value})"
          elsif type == :mutually_assured_destruction
            p "Turn #{turn_count}: *mutually_assured_destruction* 6 cards removed from play"
          end

          if @player1.has_lost? == true && @player2.has_lost? == false
            p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
            break
          elsif @player2.has_lost? == true && @player1.has_lost? == false
            p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
            break
          elsif @player1.has_lost? == true && @player2.has_lost? == true
            p "Both losers"
            break
          end
        end
      end
    else
      p "Input not understood. Bye!"
    end
    if turn_count != 1000000
      return winner
    else
      return 'DRAW'
    end
  end
end
