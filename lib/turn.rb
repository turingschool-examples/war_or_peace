require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, #:spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    # @spoils_of_war = []
  end
end

# def type
# end

# def winner
# end
#
# def pile_cards
# end
#
# def award_spoils
# end
