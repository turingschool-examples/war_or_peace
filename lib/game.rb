require 'pry'

class Game

  def initialize(player1, player2)
   @player1 = player1
   @player2 = player2
   @turn = Turn.new(@player1, @player2)
  end

  def start_game(x)
    type = @turn.type
    winner = @turn.winner
    @turn.pile_cards
    spoils = @turn.spoils_of_war.count
    @turn.spoils_of_war.shuffle!()
    @turn.award_spoils(winner)
    if type == :basic
    puts "Turn #{x+1}: #{winner.name} won 2 cards"
  elsif type == :war
    puts "Turn #{x+1}: WAR - #{winner.name} won 6 cards"
  elsif type == :mutually_assured_destruction
    puts "Turn #{x+1}: *MAD* 6 cards removed from play"
  end
end

  def play_game
    1500.times do |turn_num|
      start_game(turn_num)
      $turn_num = turn_num
      if @player1.has_lost? == true
        puts "*~* #{@player2.name} has won the game! *~*"
        break
      elsif @player2.has_lost? == true
        puts "*~* #{@player1.name} has won the game! *~*"
        break
      elsif turn_num == 1500-1
        puts "--- DRAW ---"
      end
    end
  end
end
