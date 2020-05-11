class Game
  attr_reader :turn, :count

  def initialize(turn)
    @turn = turn
    @count = 0
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{turn.player1.name} and #{turn.player2.name}"
    p "Type 'GO' to start the game!"
    p "-----------------------------------------------------------------"
    go_input = gets.chomp
    if until go_input == "GO" || go_input == 'go' do
        p "Please type 'GO' to start the game."
        go_input = gets.chomp
      end
    else
      play
    end
  end

  def play
    until turn.player1.has_lost? || turn.player2.has_lost?
      if turn.type == :basic
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        @count += 1
        p "Turn #{@count}: #{winner.name} won 2 cards"
      elsif turn.type == :war
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        @count += 1
        p "Turn #{@count}: WAR - #{winner.name} won 6 cards"
      elsif turn.type == :mutually_assured_destruction
        turn.pile_cards
        @count += 1
        p "*mutually assured destruction* 6 cards removed from play"
      end
      if turn.player1.has_lost? || turn.player2.has_lost?
        winner = turn.winner
        p "*~*~*~* #{winner.name} has won the game! *~*~*~*"
      elsif @count == 1_000_000
        p "Turn #{@count}"
        p "---- DRAW ----"
        break
      end
    end
  end
end
