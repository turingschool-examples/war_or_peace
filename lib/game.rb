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
      "---- DRAW ----"
    elsif @player1.has_lost? || @player2.has_lost?
      "*~*~*~* #{game_winner.name} has won the game! *~*~*~*"
    # else
    #   "GAME_ENDED ERROR"
    end
  end

  def round
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
      #check for less than 3 cards in deck
      # if (@player1.deck.cards.count < 3 || @player2.deck.cards.count < 3)
      #   @player1.deck.cards.count > @player2.deck.cards.count ? game_winner = @player1 : game_winner = @player2
      #   until @player1.deck.cards.count < 3 || @player2.deck.cards.count < 3
      #     small_turn = SmallTurn.new(player1, player2)
      #     @turn_count += 1
      #     winner = small_turn.winner
      #   end
      # end
    end

  end

  def start
    if game_ended == nil
      round
    else
      game_ended
    end

  end

end
