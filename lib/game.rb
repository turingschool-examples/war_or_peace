class Game
  attr_reader :turn
  def initialize(turn)
    @turn        = turn
    @turn_number = 1
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
  end

  def winner_announcement
    if player1.turn.has_lost? == true
      p "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
    else
      p "*~*~*~* #{turn.player1.name} has won the game! *~*~*~*"
    end
  end

  def play
    until (player1.turn.has_lost? == true) || (player2.turn.has_lost? == true)
      #This line is saying that until these conditions have been met, do the
      #following:
      if turn.type == :basic
        winner = turn.winner
        p "Turn #{@turn_number}, #{winner.name} has won 2 cards"
        turn.pile_cards
        turn.award_spoils(winner)
        @turn_number += 1
        #This first if statement is saying that if the turn is basic, then the
        #loser of that turn will win 2 cards from the deck, and then each player
        #will place one of their cards into the pile_cards array and repeat
        #until there is no winner(turn.award_spoils(winner)). They will do this
        #until they have met 1000001 turns.
      elsif turn.type == :war
        winner = turn.winner
        p "Turn #{@turn_number}, WAR - #{winner.name} has won 6 cards"
        turn.pile_cards
        turn.award_spoils(winner)
        @turn_number += 1
      elsif turn.type == :mutually_assured_destruction
        winner = turn.winner
        p "Turn #{@turn_number}, *mutually assured destruction* 6 cards removed from play"
        turn.pile_cards
        @turn_number += 1
      #This elsif is saying that if the turn is mutually_assured_destruction,
      #then six cards get removed from the turn.pile_cards. There is no turn.award_spoils(winner)
      #here because there is automatically no winner with this turn.
      elsif @turn_number == 1000001
        p "--- DRAW ---"
        break
      #Using the break escapes the enumerable and does not let the next iteration happen,
      #meaning no turn after 1000001 will happen because it is the last turn.
      end
    end
    return winner_announcement
  end
end
