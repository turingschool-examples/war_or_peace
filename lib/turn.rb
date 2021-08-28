class Turn

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @c1_0 = @player1.deck.rank_of_card_at(0)
    @c1_1 = @player1.deck.rank_of_card_at(1)
    @c1_2 = @player1.deck.rank_of_card_at(2)
    @c2_0 = @player2.deck.rank_of_card_at(0)
    @c2_1 = @player2.deck.rank_of_card_at(1)
    @c2_2 = @player2.deck.rank_of_card_at(2)
  end

  def type
    if (@c1_0 == @c2_0) && (@c1_2 == @c2_2)
      :mutually_assured_destruction
    elsif @c1_0 == @c2_0
      :war
    else @c1_0 != @c2_0
      :basic
    end
  end

  def winner
    if type == :basic
      if @c1_0 > @c2_0
        @player1
      else
        @player2
      end
    elsif type == :war
      if @c1_2 > @c2_2
        @player1
      else
        @player2
      end
    else
      "No Winner"
    end
  end

end
