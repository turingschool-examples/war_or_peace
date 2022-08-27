class Turn
  attr_reader :player1, :player2, :spoils_of_war

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
      else player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
    end
  end

  def winner
    if turn.type == :basic
      #player with the highest ranking card at index position 0
    elsif turn.type == :war
      #player with the highest ranking card at index position 2
    else
      "No Winner"
    end
  end



end
