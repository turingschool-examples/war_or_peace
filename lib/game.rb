require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'


class Game
  attr_reader :turn
  def initialize(turn)
    @turn = turn
  end


  def start
    i = 0
    until @turn.player1.deck == [] || @turn.player2.deck == [] || i == 100
      # binding.pry
      i += 1
      type = @turn.type
      # binding.pry
      winner = @turn.winner
      spoils_count = @turn.spoils_count
      # binding.pry
      @turn.pile_cards
      spoils_of_war = @turn.spoils_of_war
      @turn.award_spoils(winner)
      if type != :mutually_assured_destruction
          puts "Turn #{i}: #{winner.name} won #{spoils_count} cards"
      elsif :mutually_assured_destruction
       puts "*mutually assured destruction* 6 cards removed from play"
      end
      # binding.prys
    end

    if turn.player1.deck.cards == []
      puts "#{@turn.player2.name} has won the game!"
    else
      puts "#{@turn.player1.name} has won the game!"
    end
  end
end
