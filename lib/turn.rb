class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if mutually_assured_destruction?
      :mutually_assured_destruction
    elsif war?
      :war
    elsif basic?
      :basic
    else
      # ??
    end
  end

  private

  def basic?
    @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
  end

  def war?
    @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
  end

  def mutually_assured_destruction?
    if @player1.deck.cards.length > 2 && @player2.deck.cards.length > 2
      @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    else
      false
    end
  end
end
