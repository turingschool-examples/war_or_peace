require './lib/card'
require './lib/deck'
require './lib/player'
require  './lib/turn'
class Game
  attr_reader :player1,
              :player2,
              :turn
  def initialize(player1, player2)
    @player1     = player1
    @player2     = player2
    @turn_number = 1
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"

    user_input = gets.chomp

    if user_input == "GO"
      play
    end
  end

  def winner_announcement
    if player1.has_lost?
      # require "pry"; binding.pry
      p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost?
      # require "pry"; binding.pry
      p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    else
      p "--- DRAW ---"
    end
  end

  def check_winner?
    player1.has_lost? == true  || player2.has_lost? == true || @turn_number == 1000001
    # needs to return true or false based on if players have lost or count is 10000
  end

  def play
    until check_winner? do
          #This line is saying that until these conditions have been met, do the
      #following:
      @turn = Turn.new(player1, player2)
      turn.pile_cards
      turn.award_spoils(turn.winner)
      turn_results(turn)
      @turn_number += 1
      # if player1.deck.cards.length >= 3 && player2.deck.cards.length >=3
        # make_turn_go(turn)
        #Line 47 is creating a new turn instance, which is being passed on line 57 to
        #say that
      # else
      #   break
      # end
    end
    # return winner_announcement
    winner_announcement
  end

  def turn_results(turn)
    winner = turn.winner
    case turn.type
    when :basic
        p "Turn #{@turn_number}, #{winner.name} has won 2 cards"
    when :war
        p "Turn #{@turn_number}, WAR - #{winner.name} has won 6 cards"
    when :mutually_assured_destruction
        p "Turn #{@turn_number}, *mutually assured destruction* 6 cards removed from play"
    end
  end
end
