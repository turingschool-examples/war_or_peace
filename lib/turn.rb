class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn = ''
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      turn = :basic
    elsif player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      turn = :war
    else
      turn = :mutually_assured_destruction
    end
  end

  def winner
    if turn = :basic
      if player1.deck.rank_of_card_at(0) >= player2.deck.rank_of_card_at(0)
        return player1
      else
        return player2
      end
    elsif turn = :war
      if player1.deck.rank_of_card_at(2) >= player2.deck.rank_of_card_at(2)
        return player1
      else
        return player2
      end
    else
      winner = "No Winner"
    end
  end
end
