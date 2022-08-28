class Game
  def initialize(player1, player2, turn)
    @player1 = player1
    @player2 = player2
    @turn = turn
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    start = gets.chomp
    if start == 'GO'
      game_go
    else
      p 'No GO? Okay, see ya later!'
    end
  end

  def game_go
    counter = 0
    until @player1.has_lost? == true || @player2.has_lost? == true
      counter += 1
      if @turn.type == :player1_lost
        p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        break
      elsif @turn.type == :player2_lost
        p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        break
      elsif @turn.type == :mutually_assured_destruction
        @turn.pile_cards
        p "Turn #{counter}: *mutually assured destruction* 6 cards removed from play"
      elsif @turn.type == :war
        winner = @turn.winner
        @turn.pile_cards
        p "Turn #{counter}: WAR - #{winner.name} won 6 cards"
        @turn.award_spoils(winner)
      elsif @turn.type == :basic
        winner = @turn.winner
        @turn.pile_cards
        p "Turn #{counter}: #{winner.name} won 2 cards"
        @turn.award_spoils(winner)
      end

      if counter == 1_000_000
        p "---- DRAW ----"
        break
      end
    end

    if @player1.has_lost? == true
      p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    elsif @player2.has_lost? == true
      p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    end
  end
end
