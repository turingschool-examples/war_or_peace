class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.first_card == @player2.deck.first_card && @player1.deck.third_card == @player2.deck.third_card
      :mutually_assured_destruction
    elsif @player1.deck.first_card == @player2.deck.first_card
      :war
    else
      :basic
    end
  end

end
