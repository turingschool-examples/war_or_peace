


class Turn
attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (player1.rank_of_card_at(0) == player2.rank_of_card_at(0)) && (player1.rank_of_card_at(2) == player2.rank_of_card_at(2))
      return :mutually_assured_destruction

    elsif player1.rank_of_card_at(0) == player2.rank_of_card_at(0)
      return :war

    else
      :basic
    end
  end

  def winner
    #:basic -
    #when basic will return whichever player has the higher rank_of_card_at(0)

    #:war -
    #winner is whichever player has higher rank_of_card_at(2)

    #:mutually_assured_destruction -
    #returns No Winner
  end



end
