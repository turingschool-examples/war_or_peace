class Turn

attr_reader :player1,
            :player2,
            :basic,
            :war,
            :mutually_assured_destruction

  def initialize(player1, player2)
    @player1                      = player1
    @player2                      = player2
  end
end
