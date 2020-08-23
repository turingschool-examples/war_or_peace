class Game
  attr_reader :player1, :player2, :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
  end

  def game_winner
    return "---- DRAW ----" if @player1.deck.cards == [] && @player2.deck.cards == []
    return @player2 if @player1.has_lost?
    return @player1 if @player2.has_lost?
  end

  def message(turn, winner = "")
    if turn.type == :mutually_assured_destruction
      p "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
    elsif turn.type == :war
      p "Turn #{@turn_count}: WAR - #{winner.name} won #{turn.spoils_of_war.count} cards"
    elsif turn.type == :basic
      p "Turn #{@turn_count}: #{winner.name} won #{turn.spoils_of_war.count} cards"
    end
  end

  def handle_turn(turn)
    if turn.type == :mutually_assured_destruction
      turn.pile_cards
      message(turn)
    else
      winner = turn.winner
      turn.pile_cards
      message(turn, winner)
      turn.award_spoils(winner)
    end
  end
  
  def game_ended
    if (@player1.has_lost? && @player2.has_lost?) || @turn_count == 1000000
      p "---- DRAW ----"
    elsif @player1.has_lost? || @player2.has_lost?
      p "*~*~*~* #{game_winner.name} has won the game! *~*~*~*"
    end
  end

  def start
    until game_winner || @turn_count == 1000000
      turn = Turn.new(player1, player2)
      @turn_count += 1
      handle_turn(turn)
    end
    game_ended
    puts "Thanks for playing!"
  end
end
