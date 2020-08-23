class Game
  attr_reader :player1, :player2, :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
  end

  def game_winner
    return @player2 if @player1.has_lost?
    return @player1 if @player2.has_lost?
  end

  def game_ended
    if (@player1.has_lost? && @player2.has_lost?) || @turn_count == 1000000  ### set back to million
      puts "---- DRAW ----"
    elsif @player1.has_lost? || @player2.has_lost?
      puts "*~*~*~* #{game_winner.name} has won the game! *~*~*~*"
    end
  end

  def start
    until game_winner || @turn_count == 1000000  ###set back to million
      turn = Turn.new(player1, player2)
      p @player1.deck.cards.length
      p @player2.deck.cards.length
      if turn.type == :mutually_assured_destruction
        p "mutually_assured_destruction"
      end
      @turn_count += 1
      if turn.type == :mutually_assured_destruction
        "No Winner"
      else
        winner = turn.winner
      end
      turn.pile_cards
      puts "Turn #{@turn_count}: #{turn.type != :mutually_assured_destruction ? winner.name : "No Winner"} won #{turn.spoils_of_war.count} cards"
      turn.award_spoils(winner)
    end
    game_ended
  end
end
