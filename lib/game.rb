require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    p 'The players today are Megan and Aurora.'
    p "Type 'GO' to start the game!"

    i = 1
  
    while i < 1000000 && player1.has_lost? == false && player2.has_lost? == false
      turn = Turn.new(player1, player2)
      type = turn.type
      winner = turn.winner

      if type == :basic
        "Turn #{i}: #{winner.name} won 2 cards"
      elsif type == :war
        "Turn #{i}: WAR - #{winner.name} won 6 cards"
      else
        "Turn #{i}: *mutually_assured_destruction* 6 cards removed from play"
      end

      turn.pile_cards
      turn.award_spoils(winner)
      i += 1
    end

    p "*~*~*~* #{turn.winner} has won the game! *~*~*~*"

  end

end
