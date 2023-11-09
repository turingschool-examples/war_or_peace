class Turn 
  attr_reader :player1, 
              :player2, 
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war 
    else #don't NEED an else statement.  But it seems like I do need the conditional here. 

    # else player1.rank_of_card_at(0) == player2.rank_of_card_at(0) && player1.rank_of_card_at(0) == player2.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) == true
      player1
    else
      player2
    end
  end

end