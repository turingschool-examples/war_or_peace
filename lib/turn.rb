class Turn
  attr_reader :player1, :player2, :spoils_of_war, :turn_type, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_type = nil
    @winner = nil
  end

  def both_cards_same_at(index)
    @player1.deck.rank_of_card_at(index) == @player2.deck.rank_of_card_at(index)
  end

  def type
    if both_cards_same_at(0) && both_cards_same_at(2)
      @turn_type = :mutually_assured_destruction
    elsif both_cards_same_at(0)
      @turn_type = :war
    else
      @turn_type = :basic
    end
    @turn_type
  end

  def determine_winner
    if @turn_type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = @player1
      else
        @winner = @player2
      end
    elsif @turn_type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = @player1
      else
        @winner = @player2
      end
    else
      @winner = "No Winner"
    end
  end

end
