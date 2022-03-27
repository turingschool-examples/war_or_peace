require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/game.rb'
require 'pry'


class Game
  def initialize (player1, player2)
  @turn_count = turn_count
  end


  def start
    turn = turn.new(0)
    winner = turn.winner
    pile_cards = turn.pile_cards
    spoils_of_war = turn.spoils_of_war(winner)

    until player1.has_lost? || player2.has_lost? || turn_count = 1000001
      p "Turn #{@turn_count}: "
      if type == :basic
        p "#{turn.winner.name} has won 2 cards"
      elsif type == :war
        p "WAR - #{turn.winner.name} has won 6 cards"
      else type == :mutually_assured_destruction
        p "*mutually assured destruction* 6 cards removed from play"
      end

      if player1.has_lost?
        p "#{player2.name} has won!"
      elsif player2.has_lost?
        p "#{player1.name} has won!"
      else turn.count == 1000001
        p "This game is a draw!"

      end
      @turn_count += 1
  end
end
