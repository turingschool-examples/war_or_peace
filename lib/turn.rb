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

 def type
   # @basic = basic
   # @war = war
   # @mutually_assured_destruction = mutually_assured_destruction
   if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
     :basic
   elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
     :war
   else player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(2) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
     :mutually_assured_destruction
   end
 end

 def pile_cards

 end

 def award_spoils

 end
end
