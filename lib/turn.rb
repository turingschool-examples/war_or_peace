class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if self.type == :basic
      (@player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0))
      @player1
    elsif self.type == :basic
      (@player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0))
      @player2
    else
      "NO"
    end

  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << @player1.deck.cards[0] && @spoils_of_war << @player2.deck.cards[0]
      @player1.deck.remove_card
      @player2.deck.remove_card
    else
      "NO"
    end
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war
    winner.deck.cards.flatten!
  end
end
