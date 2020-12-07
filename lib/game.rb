require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
    start
  end

  def intro
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora"
    p "Type 'GO' to start the game!"
    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

    phrase = gets.chomp

    if phrase != "GO"
      intro
    else
      start
    end
  end

  def start
    i = 0
    while i < 10000
    i += 1
    # until turn.player1.has_lost? || turn.player2.has_lost?

      type = turn.type
      winner = turn.winner
      turn.pile_cards
      if type == :basic
        puts "Turn #{i} #{winner.name} won 2 cards"
        turn.award_spoils(winner)

      elsif type == :war
        puts "Turn #{i} WAR - #{winner.name} won 6 cards"
        turn.award_spoils(winner)

      elsif type == :mutually_assured_destruction
        puts "Turn #{i} *mutually assured destruction* 6 cards removed from play"
      end
    end

    if turn.player1.has_lost?
      p  "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    else turn.player2.has_lost?
      puts  "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    end
  
  end
end
