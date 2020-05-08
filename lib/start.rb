require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

# does the start class only query for information?
# does it take an argument?
# what if it takes turn as an argument?
# what will it do with a turn?

# it can ask a turn to get retvals
# get symbols for hash table lookup in terminal
# get info about who won the game
# who lost the game / out of cards

# what logic happens here?
# does this class know about turn_n ?
# what does it mean to Start.new(Turn)

# The start class can handle generating the cards and such?

class Start
  attr_reader :turn

  def initialize(turn)
    @turn = turn
    start
  end

  def start
    until @turn.players.any? { |player| player.has_lost? == true }
      if @turn.winner.class == String
        p @turn.winner
      else
        p @turn.winner.name
      end
      @turn.pile_cards
      @turn.award_spoils(@turn.winner)
    end
  end


end

# what does Start.new(turn) return?
# it returns a turn obj instance
#
