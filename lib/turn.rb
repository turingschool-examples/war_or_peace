class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @player1_top_card = @player1.deck.rank_of_card_at(0)
    @player2_top_card = @player2.deck.rank_of_card_at(0)
    @player1_third_card = @player1.deck.rank_of_card_at(2)
    @player2_third_card = @player2.deck.rank_of_card_at(2)
  end

  def type
    if @player1_top_card == @player2_top_card && @player1_third_card == @player2_third_card
      :mutually_assured_destruction
    elsif @player1_top_card == @player2_top_card
      :war
    else
      :basic
    end
  end

  def winner
    if self.type == :basic
      if (@player1_top_card > @player2_top_card)
         @player1
      else
        @player2
      end
    elsif self.type == :war
      if (@player1_third_card > @player2_third_card)
        @player1
      else
        @player2
      end
    else
      "No Winner"
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]

      @player1.deck.remove_card
      @player2.deck.remove_card

    elsif self.type == :war
      @spoils_of_war << @player1.deck.cards[0..2]
      @spoils_of_war << @player2.deck.cards[0..2]

      3.times {@player1.deck.remove_card}
      3.times {@player2.deck.remove_card}

      @spoils_of_war.flatten!
    else
      3.times {@player1.deck.remove_card}
      3.times {@player2.deck.remove_card}
    end
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war
    winner.deck.cards.flatten!
  end
end
