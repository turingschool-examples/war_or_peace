class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
  @player1 = player1
  @player2 = player2
  end

  def start
    i = 1
    first_turn = Turn.new(@player1,@player2)
      if first_turn.type == :mutually_assured_destruction
        puts "Turn #{i.to_s}: *mutually assured destruction* 6 cards removed from play"
      elsif first_turn.type == :war
        puts "Turn #{i.to_s}: WAR - #{first_turn.winner.name} won 6 cards"
      else
        puts "Turn #{i.to_s}: #{first_turn.winner.name} won 2 cards"
      end
      first_turn.pile_cards
      first_turn.award_spoils(first_turn.winner)

    while !@player1.has_lost? && !@player2.has_lost?
      i += 1
      current_turn = Turn.new(@player1,@player2)
      if @player1.has_lost? || @player2.has_lost?
        return
      end
      if current_turn.type == :mutually_assured_destruction
        puts "Turn #{i.to_s}: *mutually assured destruction* 6 cards removed from play"
      elsif current_turn.type == :war
        puts "Turn #{i.to_s}: WAR - #{current_turn.winner.name} won 6 cards"
      else
        puts "Turn #{i.to_s}: #{current_turn.winner.name} won 2 cards"
      end
      current_turn.pile_cards
      current_turn.award_spoils(current_turn.winner)
    end

    if @player1.has_lost?
      winner_of_game = @player2
    else
      winner_of_game = @player1
    end
    puts "*~*~*~* #{current_turn.winner.name} has won the game! *~*~*~*"
  end

end
