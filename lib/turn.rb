 class Turn
   attr_reader  :player1,
                :player2,
                :spoils_of_war

   def initialize(player1, player2)
     @player1 = player1
     @player2 = player2
     @spoils_of_war = []
   end

   #add cards in spoils_of_war to the winner of the turn
   def award_spoils
   end

   #cards will be sent from player deck to spoils_of_war
   def pile_cards
   end

   #basic, war, of mutally_assured_destruction
   def type
     #if rank_of_card_at(0) are not the same, then basic
    if player1.rank_of_card_at(0) != player2.rank_of_card_at(0)
       :basic
    #if rank_of_card_at(0) are the same, then war
    elsif player1.rank_of_card_at(0) == player2.rank_of_card_at(0)
      :war
    #if rank_of_card_at(0) and (2) are the same,
    #then mutally_assured_destruction
  elsif player1.rank_of_card_at(0) == player2.rank_of_card_at(0) &&
    player1.rank_of_card_at(2) == player2.rank_of_card_at(2)
      :mutally_assured_destruction
    end
   end

   #determines winner of war
   def winner
     #if basic
     #elsif war
     #elsif mutally_assured_destruction
   end
 end
