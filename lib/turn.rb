require './lib/deck'
require './lib/card'
require './lib/player'

class Turn
attr_reader :player1, :player2

def initialize(player1_param, player2_param)
  @player1 = player1_param
  @player2 = player2_param
  @spoils_of_war = []
end

# def type
#   if @player1.deck.rank_of_card_at(0) ==  @player.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) ==  @player.deck.rank_of_card_at(2)
#     :mutually_assured_destruction
#   elsif
#
# end

end
