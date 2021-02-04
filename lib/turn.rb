class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    player1_at_0 = player1.deck.rank_of_card_at(0)
    player1_at_2 = player1.deck.rank_of_card_at(2)
    player2_at_0 = player2.deck.rank_of_card_at(0)
    player2_at_2 = player2.deck.rank_of_card_at(2)

    if player1_at_0 == player2_at_0 && player1_at_2 == player1_at_2
      :mutually_assured_destruction
    elsif player1_at_0 == player2_at_0
      :war
    else
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
      "No Winner"
    elsif type == :war
      return_bigger_winner(2)
    elsif type == :basic
      return_bigger_winner(0)
    end
  end

  def return_bigger_winner(index)
    if player1.deck.rank_of_card_at(index) > player2.rank_of_card_at(index)
      player1
    else
      player2
    end
  end

end
