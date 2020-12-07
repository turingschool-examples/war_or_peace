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

  def start
    i = 0
    while i < 5001
    i += 1

    type = turn.type
    winner = turn.winner
    turn.award_spoils(winner)

    if turn.player1.has_lost? == true
      p " #{player2} has won the game!!!"
      break
    elsif turn.player2.has_lost? == true
      p "#{player1} has won the gane!!!"
      break
    end

    if winner == turn.player1.name && type == :basic
      p "Turn#{i}: #{turn.player1.name} has won the turn."
    elsif winner == turn.player2.name && type == :basic
      p "Turn#{i}: #{turn.player2.name} has won the turn."
    elsif winner == turn.player1.name && type == :war
      p "Turn#{i}: #{turn.player1.name} has won the turn."
    elsif winner == turn.player2.name && type == :war
      p "Turn#{i}: #{turn.player2.name} has won the turn."
    else
      p "Turn#{i}: 6 cards byebye"
    end
  end
end
end
