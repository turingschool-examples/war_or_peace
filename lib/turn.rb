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
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    end
  end


  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    elsif type == :mutually_assured_destruction
        "No Winner"
    end
  end

  # def pile_cards
  # end
  #
  # def award_spoils
  # end

end
