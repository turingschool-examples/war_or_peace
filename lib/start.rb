require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'
require '../lib/start'

class Start
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    counter = 0
    while counter < 1
      # require "pry"; binding.pry
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      if turn.type == :basic
        p "Turn #{counter + 1}: #{winner.name} won 2 cards"
      end
      # require "pry"; binding.pry
      counter += 1
    end
  end
end
