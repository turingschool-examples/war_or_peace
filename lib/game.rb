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
      loop do
        turn_count += 1
        if turn_count == 1000001
          p "---- DRAW ----"
          break
        else
          if @player1.has_lost? == false && @player2.has_lost? == false
            turn = Turn.new(@player1, @player2)
            type = turn.type
            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)
            if type == :basic
              p "Turn #{turn_count}: #{winner.name} won 2 cards."
            elsif type == :war
              p "Turn #{turn_count}: WAR - #{winner.name} won 6 cards"
            elsif type == :mutually_assured_destruction
              p "Turn #{turn_count}: *mutually_assured_destruction* 6 cards removed from play"
            end
          elsif @player1.has_lost? == true && @player2.has_lost? == false
            p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
            break
          elsif @player2.has_lost? == true && @player1.has_lost? == false
            p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
            break
          elsif
            p "Both losers"
            break
          end #if player has lost
        end #if turn_count
      end #loop
    else
      p "Error: input not understood."
    end #if input
  end #method
end #class
