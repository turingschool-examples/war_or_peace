class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

   def type
     if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
       return :basic
     elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
       if player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
       return :mutually_assured_destruction
       else return :war
       end

     end
   end

   def winner
     if type == :basic
       if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
         return player1
       else player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
         return player2
       end
     elsif type == :war
       if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
         return player1
       else player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
         return player2
       end
     else type == :mutually_assured_destruction
       return 'No Winner'
     end

   end

   def pile_cards
     @spoils_of_war << player1.deck.cards[0]
     player1.deck.cards.shift
     @spoils_of_war << player2.deck.cards[0]
     player2.deck.cards.shift
   end

   def award_spoils(winner)
     winner.deck.cards << spoils_of_war
   end
end
