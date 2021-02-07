require './lib/card'
require './lib/deck'
require './lib/player'
require  './lib/turn'
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

    user_input = gets.chomp

    if user_input == "GO"
      play
    end
  end

  def winner_announcement
    if turn.player1.has_lost? == true
      p "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
    else
      p "*~*~*~* #{turn.player1.name} has won the game! *~*~*~*"
    end
  end

  def check_winner?
    if turn.player1.has_lost? == true || turn.player2.has_lost? == true || @turn_number == 2000
      winner_announcement
    end
  end

  def play
    # require 'pry'; binding.pry
    until check_winner? do
          #This line is saying that until these conditions have been met, do the
      #following:
      if turn.player1.deck.cards.length >= 3 && turn.player2.deck.cards.length >=3
        make_turn_go
      end
    end
    # return winner_announcement
  end

  def make_turn_go
   if turn.type == :basic
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        p "Turn #{@turn_number}, #{winner.name} has won 2 cards"
        @turn_number += 1
    elsif turn.type == :war
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        p "Turn #{@turn_number}, WAR - #{winner.name} has won 6 cards"
        @turn_number += 1
    elsif turn.type == :mutually_assured_destruction
        winner = turn.winner
        turn.pile_cards
        p "Turn #{@turn_number}, *mutually assured destruction* 6 cards removed from play"
        @turn_number += 1
    elsif @turn_number == 1999
        p "--- DRAW ---"
    end
  end
end
