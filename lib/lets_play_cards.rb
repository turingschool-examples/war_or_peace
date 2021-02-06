require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class War
  attr_reader :turn

  def initialize(turn)
    @turn = turn
    @go
  end

  def say_go
    puts "---" * 10
    @go = $stdin.gets.upcase.chomp
  end

  def ask_start
    "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are #{turn.player1.name} and #{turn.player2.name}. Type 'GO' to start the game!"
  end

  def start
    p ask_start

    say_go

    if @go == "GO"
      turn_counter = 1
      until turn.player1.has_lost? == true || turn.player2.has_lost? == true || turn_counter == 1000000 do
        winner_of_turn = turn.winner
        type_of_turn = turn.turn_type
        turn.pile_cards
        case type_of_turn
        when :mutually_assured_destruction
          p "Turn #{turn_counter}: *mutually assured destruction* 6 cards removed from play"
        when :war
          turn.awards_spoils(winner_of_turn)
          p "Turn #{turn_counter}: WAR - #{winner_of_turn.name} won 6 cards"
        when :basic
          turn.awards_spoils(winner_of_turn)
          p "Turn #{turn_counter}: #{winner_of_turn.name} won 2 cards"
        end
        turn_counter += 1
      end
      if turn.player1.has_lost?
        p "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
      elsif turn.player2.has_lost?
        p "*~*~*~* #{turn.player1.name} has won the game! *~*~*~*"
      else
        p "---- DRAW ----"
      end
    else
      p "What game do you want to play!?"
    end
  end

end
