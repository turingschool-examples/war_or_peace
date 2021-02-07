class Game
  attr_reader :player1, :player2
  attr_accessor :turn_number

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_number = 1
  end

  def begin
    game_starter
    puts final_message
  end

  def game_starter
    until game_ender
      turn = Turn.new(player1, player2)
      turn_type = turn.type
      turn_winner = turn.winner
      p "#{player1.name} now has #{player1.deck.cards.length} cards"
      p "#{player2.name} now has #{player2.deck.cards.length} cards"
      turn.pile_cards
      turn.award_spoils(turn_winner)
      puts turn_messages(turn_type, turn_winner)

      @turn_number += 1
    end
  end

  def turn_messages(turn_type, winner)
    if turn_type == :mutually_assured_destruction
      "Turn #{@turn_number}: *mutually assured destruction* 6 cards removed from play"
    elsif turn_type == :basic
      "Turn #{@turn_number}: #{winner.name} won 2 cards"
    elsif turn_type == :war
      "Turn #{@turn_number}: WAR - #{winner.name} won 6 cards"
    end
  end

  def final_message
    if player1.has_lost?
      "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost?
      "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    else
      "---- DRAW ----"
    end
  end

  def game_ender
    @turn_number == 1000000 || player1.has_lost? || player2.has_lost?
  end

end
