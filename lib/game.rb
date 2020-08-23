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
    if (@player1.has_lost? && @player2.has_lost?) || @turn_count == 1000000
      puts "---- DRAW ----"
    elsif @player1.has_lost? || @player2.has_lost?
      puts "*~*~*~* #{game_winner.name} has won the game! *~*~*~*"
    end
  end

  def start
    until game_winner || @turn_count == 1000000
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
      ### might want to put an if statement below instead of what current puts statement.
      ###   It might be more readable and also you need to add 'WAR - ' in for that type
      ### UPDATE: must use if statement. Right now on MAD, the winner from previous
      ###   hand is brought up and "wins 0 cards". This should probably be put into
      ###   a method and called here rather than piling up methods in start method.
      ###   I took a screenshot to show what I'm talking about.
      puts "Turn #{@turn_count}: #{turn.type != :mutually_assured_destruction ?
        "#{winner.name} won #{turn.spoils_of_war.count} cards" : "*mutually assured
        destruction* 6 cards removed from play"}"
      turn.award_spoils(winner)
    end
    game_ended
  end
end
