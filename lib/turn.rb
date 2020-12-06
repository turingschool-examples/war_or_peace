class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
              :turn
  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @spoils_of_war = []
    @turn = nil
  end
  def type
    p1_rank_0 = player1.deck.rank_of_card_at(0)
    p2_rank_0 = player2.deck.rank_of_card_at(0)
    p1_rank_2 = player1.deck.rank_of_card_at(2)
    p2_rank_2 = player2.deck.rank_of_card_at(2)
    if p1_rank_0 == p2_rank_0 && p1_rank_2 == p2_rank_2
      @turn = :mutually_assured_destruction
    elsif p1_rank_0 == p2_rank_0 && p1_rank_2 != p2_rank_2
      @turn = :war
    else
      @turn = :basic
    end
    @turn
  end
end

def winner
   if @turn == :basic
     p1_rank_0 = player1.deck.rank_of_card_at(0)
     p2_rank_0 = player2.deck.rank_of_card_at(0)
     if p1_rank_0 > p2_rank_0
       return player1
     else
       return player2
     end
   elsif @turn == :war
     p1_rank_2 = player1.deck.rank_of_card_at(2)
     p2_rank_2 = player2.deck.rank_of_card_at(2)
     if p1_rank_2 > p2_rank_2
       return player1
     else
       return player2
     end
   elsif @turn == :mutually_assured_destruction
     return "No Winner"
   else
     return "You must take a turn"
   end
 end
