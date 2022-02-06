
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    play_game(0)
  end

  def play_game(turn_count)
    puts "---- DRAW ----" if turn_count == 1000000

    @turn = (Turn.new(@turn.player1, @turn.player2))
    if @turn.player1.has_lost?
      puts "*~*~*~* #{@turn.player2.name} has won the game! *~*~*~"
    elsif @turn.player2.has_lost?
      puts "*~*~*~* #{@turn.player1.name} has won the game! *~*~*~"
    else
      take_turn
      turn_count += 1
      play_game(turn_count)
    end
  end

  def take_turn
    winner = @turn.winner
    if @turn.type == :basic
      @turn.pile_cards
      @turn.award_spoils(winner)
      puts "#{winner.name} won #{@turn.spoils_of_war.count} cards"
    elsif @turn.type == :war
      @turn.pile_cards
      @turn.award_spoils(winner)
      puts "WAR - #{winner.name} won #{@turn.spoils_of_war.count} cards"
    else
      @turn.pile_cards
      puts "* mutually assured destruction * #{@turn.spoils_of_war.count} cards removed from play"
    end
  end
end
