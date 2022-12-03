require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require 'pry'

class Turn
  attr_accessor :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 0
  end

  def go 

    loop do
    @turn += 1
    if @player1.deck.cards.last.rank > @player2.deck.cards.last.rank
      puts "TURN #{@turn}: #{@player1.name} won 2 cards"
      @player1.deck.cards.unshift(@player1.deck.cards.pop)
      @player1.deck.cards.unshift(@player2.deck.cards.pop)
    elsif @player2.deck.cards.last.rank > @player1.deck.cards.last.rank
      puts "TURN #{@turn}: #{@player2.name} won 2 cards"
      @player2.deck.cards.unshift(@player2.deck.cards.pop)
      @player2.deck.cards.unshift(@player1.deck.cards.pop)
    else
      p1_war = []
      p2_war = []
      3.times do
        p1_war << @player1.deck.cards.pop
        p2_war << @player2.deck.cards.pop
      end
      if p1_war.last.rank > p2_war.last.rank
        puts "TURN #{@turn}: WAR - #{@player1.name} won 6 cards"
        p1_war.each {|card| @player1.deck.cards << card}
        p2_war.each {|card| @player1.deck.cards << card}

        # @player1.deck.cards << p1_war
        # @player1.deck.cards << p2_war

      elsif p1_war.last.rank < p2_war.last.rank
        p1_war.each {|card| @player2.deck.cards << card}
        p2_war.each {|card| @player2.deck.cards << card}
        # @player2.deck.cards << p1_war
        # @player2.deck.cards << p2_war
        puts "TURN #{@turn}: WAR - #{@player2.name} won 6 cards"
      else 
        puts "TURN #{@turn}: *mutually assured destruction* 6 cards removed from play"
        p1_war = []
        p2_war = []
      end
    end

    if @player1.has_lost?
      puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
      break
    end

    if @player2.has_lost?
      puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
      break
    end

    if (@turn == 1_000_000)
      puts "---- DRAW ----"
        break
    end

  end

  end


end