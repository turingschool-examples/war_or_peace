require './card'
require './deck'
require './player'

class Turn
  attr_reader :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 0
  end

  def GO 

    loop do
    @turn += 1
    if player1.deck.last.rank > player2.deck.last.rank
      puts "#{player1.name} won 2 cards"
      player1.deck.unshift(player1.deck.pop)
      player1.deck.unshift(player2.deck.pop)
    elsif player2.deck.last > player1.deck.last
      puts "#{player2.name} won 2 cards"
      player2.deck.unshift(player2.deck.pop)
      player2.deck.unshift(player1.deck.pop)
    else
      p1_war = []
      p2_war = []
      3.times do
        p1_war << [player1.deck.pop]
        p2_war << [player2.deck.pop]
      end
      if p1_war.last.rank > p2_war.last.rank
        puts "WAR - #{player1.name} won 6 cards"
        player1.deck << p1_war
        player1.deck << p2_war
      elsif p1_war.last < p2_war.last 
        player2.deck << p1_war
        player2.deck << p2_war
        puts "WAR - #{player2.name} won 6 cards"
      else 
        puts "*mutually assured destruction* 6 cards removed from play"
        p1_war = []
        p2_war = []
      end
    end

    if (@turns == 1_000_000)
        break
    end

  end

  end


end