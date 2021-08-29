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
    if (@player1.deck.cards[0] == @player2.deck.cards[0]) &&
      (@player1.deck.cards[2] == @player2.deck.cards[2])
      return :mutually_assured_desruction
    elsif @player1.deck.cards[0] == @player2.deck.cards[0]
      return :war
    else
      return :basic
    end
  end

  def winner

  end

  def pile_cards

  end


end
