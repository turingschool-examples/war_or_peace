class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def intialize(player1, player2, spoils_of_war)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type(:basic, :war, :mutually_assured_destruction)
    :basic if player1.rank_of_card_at(0) != player2.rank_of_card_at(0)
    :war if player1.rank_of_card_at(0) == player2.rank_of_card_at(0)
    :mutually_assured_destruction if player1.rank_of_card_at(0) == player2.rank_of_card_at(0)&&
    player1.rank_of_card_at(2) == player2.rank_of_card_at(2)
  end

  def winner
    if player1.rank_of_card_at(0) > player2.rank_of_card_at(0)
      p "Player 1 wins!"
    else
      p "Player 2 wins"
    end
  end
