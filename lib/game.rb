require "./lib/card.rb"
require "./lib/deck.rb"
require "./lib/player.rb"
require "./lib/turn.rb"

class Game 
  def initialize(player1, player2)
    @player1 = player1 
    @player2 = player2
  end

  def start 
    count = 1
    until count == 1000001 || @player1.has_lost? || @player2.has_lost? do 
      turn = Turn.new(@player1, @player2)
      if turn.type == :mutually_assured_destruction
        puts "Turn #{count}: *mutually assured destruction* 6 cards removed from play"
      elsif turn.type == :war 
        puts "Turn #{count}: WAR - #{turn.winner.name} won 6 cards"
      else
        puts "Turn #{count}: #{turn.winner.name} won 2 cards"
      end
      if turn.type == :basic || turn.type == :war 
        winner = turn.winner 
        turn.pile_cards 
        turn.award_spoils(winner)
      else 
        turn.pile_cards
      end
      count += 1
    end 
    if count == 1000001
      puts "---- DRAW ----"
      return 3
    elsif @player1.has_lost? 
      puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
      return 2
    else 
      puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
      return 1
    end
  end
end

