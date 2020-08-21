class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def top_card(player)
    if player == @player1
      @player1.deck.rank_of_card_at(0)
    else
      @player2.deck.rank_of_card_at(0)
    end
  end

  def third_card(player)
    if player == @player1
      @player1.deck.rank_of_card_at(2)
    else
      @player2.deck.rank_of_card_at(2)
    end
  end

  def type
    if top_card(@player1) == top_card(@player2) && third_card(@player1) == third_card(@player2)
      :mutually_assured_destruction
    elsif top_card(@player1) == top_card(@player2)
      :war
    else
      :basic
    end
  end

  def winner
    if self.type == :basic
      if (top_card(@player1) > top_card(@player2))
         @player1
      else
        @player2
      end
    elsif self.type == :war
      if (third_card(@player1) > third_card(@player2))
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
