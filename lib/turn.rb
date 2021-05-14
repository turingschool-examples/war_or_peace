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
    if player1.first_card != player2.first_card
      :basic
    elsif player1.first_card == player2.first_card && player1.third_card == player2.third_card
      :mutually_assured_destruction
    elsif player1.first_card == player2.first_card
      :war
    end
  end
end
