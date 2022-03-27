require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/game.rb'
require 'pry'


class Game
  attr_reader :turn_count, :player1, :player2
  def initialize (player1, player2)
  @turn_count = 0
  @player1 = player1
  @player2 = player2
  end


  def start


    until player1.has_lost? || player2.has_lost? || turn_count == 1000001
      turn = Turn.new(player1, player2)
      type = turn.type
      winner = turn.winner


      p "Turn #{@turn_count}: "
      if type == :basic
        p "#{winner.name} has won 2 cards"
      elsif type == :war
        p "WAR - #{winner.name} has won 6 cards"
      else type == :mutually_assured_destruction
        p "*mutually assured destruction* 6 cards removed from play"
      end
      @turn_count += 1
    end

    turn.pile_cards

    turn.spoils_of_war

      if player1.has_lost?
        p "#{player2.name} has won!"
      elsif player2.has_lost?
        p "#{player1.name} has won!"
      else @turn_count == 1000001
        p "This game is a draw!"
      end
  end
end
