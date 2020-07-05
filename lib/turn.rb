require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
end

def type
  if player1.deck1.cards.rank(0) == player2.deck2.cards.rank(0) && player1.deck1.cards.rank(2) == player2.deck2.cards.rank(2)
    :mutually_assured_destruction
  elsif player1.deck1.cards.rank(0) == player.deck2.cards.rank(0)
    :war
  else
    :basic
  end
end

# def winner
# end
#
# def pile_cards
#   @spoils of war <<
# end
#
# def award_spoils
# end
