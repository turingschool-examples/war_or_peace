require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class Game
  attr_reader :turn, :turn_number

  def initialize(turn)
    @turn = turn
    @turn_number = 0
  end

  def win_game
    if @turn.player1.has_lost?
    puts "*~*~*~* #{@turn.player2.name} has won the game! *~*~*~*"
  elsif @turn.player2.has_lost?
    puts "*~*~*~* #{@turn.player1.name} has won the game! *~*~*~*"
    else
    puts "----DRAW----"
    end
  end

  def start
    until  @turn.player1.has_lost? || @turn.player2.has_lost? || @turn_number == 1000000 do
      @turn_number += 1
      if @turn.type == :basic
        winner = @turn.winner
        p "Turn #{@turn_number}: #{@turn.winner.name} won 2 cards"
        @turn.pile_cards
        @turn.award_spoils(winner)
        # puts "P1: #{@turn.player1.deck.cards}"
        # puts "P2: #{@turn.player2.deck.cards}"
      elsif @turn.type == :war && @turn.player1.deck.cards.count <= 2
        # binding.pry
        @turn.player1.deck.cards.clear
      elsif @turn.type == :war && @turn.player2.deck.cards.count <= 2
        # binding.pry
        @turn.player2.deck.cards.clear
      elsif @turn.type == :war
        winner = @turn.winner
        p "Turn #{@turn_number}: WAR - #{@turn.winner.name} won 6 cards"
        @turn.pile_cards
        @turn.award_spoils(winner)
        # puts "P1: #{@turn.player1.deck.cards}"
        # puts "P2: #{@turn.player2.deck.cards}"
      elsif @turn.type == :mutually_assured_destruction
        @turn.pile_cards
        p "Turn #{@turn_number}: *mutually assured destruction* 6 cards removed from play"
        # puts "P1: #{@turn.player1.deck.cards}"
        # puts "P2: #{@turn.player2.deck.cards}"
      end
    end
    win_game
  end

end
