class Turn
  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
  end

  def player1
    @player1
  end

  def player2
    @player2
  end

  def spoils_of_war
    cards_won = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      type = :basic
    # elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
    #   type = :war
    # else player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
    #   type = :mutually_assured_destruction
    end
  end
end
