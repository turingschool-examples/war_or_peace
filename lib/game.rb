class Game
require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require 'pry'
attr_reader :player1,
            :player2,
            :turn_number

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_number = 0

  end

  def start

    until @player1.has_lost? || @player2.has_lost? || @turn_number == 10000 do
      @turn_number += 1
      turn = Turn.new(@player1, @player2)
      type = turn.type
      winner = turn.winner(type)
      turn.pile_cards(type)
      turn.award_spoils(winner)

      if(type == :basic)
        puts "Turn #{turn_number}: #{winner.name} won 2 cards"
      elsif(type == :war)
        puts "Turn #{turn_number}: WAR - #{winner.name} won 6 cards"
      else
        puts "Turn #{turn_number} *mutually assured destruction* " +
          "6 cards removed from play"
      end

      if(player1.has_lost?)
        puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      elsif(player2.has_lost?)
        puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
      elsif(@turn_number == 10000)
        puts "---- DRAW ----"
      end
    end
  end

end
