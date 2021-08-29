class Game
  attr_reader :turn
  def initialize(turn)
    @turn = turn
  end

  def start

      count = 1
      while (!@turn.player1.has_lost?) && (!@turn.player2.has_lost?) && (count <= 1000000000)
          if @turn.type == :basic
            puts "Turn #{count}: #{@turn.winner.name} won 2 cards"
            winner = @turn.winner
            @turn.pile_cards
            @turn.award_spoils(winner)
          elsif @turn.type == :war
            puts "Turn #{count}: WAR - #{@turn.winner.name} won 6 cards"
            winner = @turn.winner
            @turn.pile_cards
            @turn.award_spoils(winner)
          elsif @turn.type == :mutually_assured_destruction
            puts "Turn #{count}: *mutually assured destruction* 6 cards removed from play"
            @turn.pile_cards
          end

          count += 1

      end

      if @turn.player1.has_lost?
        puts "*~*~*~* #{@turn.player2.name} has won the game! *~*~*~*"
      elsif @turn.player2.has_lost?
        puts "*~*~*~* #{@turn.player1.name} has won the game! *~*~*~*"
      else
        puts "---- DRAW ----"
      end

  end
end
