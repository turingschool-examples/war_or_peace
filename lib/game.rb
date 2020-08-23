class Game
  attr_reader :turn
  def initialize(turn)
    @turn = turn
    @turn_counter = 1
  end

  def start
    p 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    p 'The players today are Megan and Aurora.'
    p 'Type GO to start the game!'
    p '------------------------------------------------------------------'
  end

  def play
    until turn.player1.has_lost? == true || turn.player2.has_lost? == true
      if @turn_counter == 1000001
        p "---- DRAW ----"
        break
      elsif turn.type == :basic
        winner = turn.winner
        p "Turn #{@turn_counter}: #{winner.name} has won 2 cards"
        turn.pile_cards
        turn.award_spoils(winner)
        @turn_counter += 1
      elsif turn.type == :war
        winner = turn.winner
        p "Turn #{@turn_counter}: WAR - #{winner.name} has won 6 cards"
        turn.pile_cards
        turn.award_spoils(winner)
        @turn_counter += 1
      elsif turn.type == :mutually_assured_destruction
        p "Turn #{@turn_counter}: *mutually assured destruction* 6 cards removed from play"
        turn.pile_cards
        @turn_counter += 1
      end
    end
    winner_statement
  end

  def winner_statement
    if turn.player1.has_lost? == true
      p "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
    elsif turn.player2.has_lost? == true
      p "*~*~*~* #{turn.player1.name} has won the game! *~*~*~*"
    end
  end

end
