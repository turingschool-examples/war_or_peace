require './lib/turn.rb'
require 'pry'


class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    turn_count = 0

    until @player1.has_lost? || @player2.has_lost? || turn_count == 1000000 do
      turn = Turn.new(@player1, @player2)
      turn_count += 1
  # binding.pry

        if turn.type == :basic
          p "Turn #{turn_count}: #{turn.winner.name} won 2 cards"
          turn.pile_cards
          turn.winner
          turn.award_spoils

        elsif turn.type == :war
          p "Turn #{turn_count}: WAR - #{turn.winner.name} won 6 cards"
          turn.pile_cards
          turn.winner
          turn.award_spoils
        elsif turn.type == :mutually_assured_destruction
          # binding.pry
          p "Turn #{turn_count}: *mutually_assured_destruction* 6 cards removed from play"
          turn.pile_cards

        end
    end

    if turn.player1.deck.cards.count == 0
      p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    elsif turn.player2.deck.cards.count == 0
      p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    elsif turn_count == 1000000
      p "---- DRAW ----"
    end
  end
end
    # binding.pry
