class SmallTurn
## this class is developed to run only when there are less than 3 cards in somone's deck
  attr_reader :player1, :player2, :winning

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @winning = nil
    @player1_top_card = @player1.deck.rank_of_card_at(0)
    @player2_top_card = @player2.deck.rank_of_card_at(0)
  end

  def who_is_winning
    @player1.deck.cards.count > @player2.deck.cards.count ? @winning = @player1 : @winning = @player2
  end

  def type
  end

  def type
    if @player1_top_card == @player2_top_card
      :war
    # elsif @player1_top_card == @player2_top_card
    #   @og_type = :war
    #   :war
    elsif @player1_top_card != @player2_top_card
      :basic
    end
  end

  def winner
    if type == :basic
      if @player1_top_card > @player2_top_card
        @player1
      else
        @player2
      end
    elsif type == :war
      "*~*~*~* #{@winning} has won the game! *~*~*~*"
      
    end
  end

end
