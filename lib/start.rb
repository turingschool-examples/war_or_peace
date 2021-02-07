class Start
  attr_reader :turn, :turn_count

  def initialize(turn)
    @turn = turn
    @turn_count = 0
  end

  def start_game
    if turn.type == :mutually_assured_destruction
      # turn.pile_cards
      puts "Turn #{@turn_count += 1}: *mutually assured destruction* 6 cards removed from play"
    elsif turn.type == :basic
      # turn.pile_cards
      # turn.award_spoils
      puts "Turn #{@turn_count += 1}: #{turn.winner.name} won 2 cards"
    elsif turn.type == :war
      # turn.pile_cards
      # turn.award_spoils
      puts "Turn #{@turn_count += 1}: WAR - #{turn.winner.name} won 6 cards"
    end
    turn.pile_cards
    turn.award_spoils
  end

  def announce_winner
    if turn.player1.has_lost?
      puts "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
    elsif turn.player2.has_lost?
      puts "*~*~*~* #{turn.player1.name} has won the game! *~*~*~*"
    elsif @turn_count > 1000000
      "---- DRAW ----"
    end
  end
end
