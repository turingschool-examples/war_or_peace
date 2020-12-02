class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type

  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
    @type_of_turn  = nil
    @winner        = nil
    @type_class    = {[false, false] => :basic,
                      [false, true] => :basic,
                      [true, false] => :war,
                      [true, true] => :mutually_assured_distruction}
  end

  def compaire(index)
    player1.deck.cards.slice(index).rank ==
    player2.deck.cards.slice(index).rank
  end

  def type
    @type_of_turn = @type_class[[compaire(0), compaire(2)]]
  end

  def winner
    if @type_of_turn == :basic
      @winner = @player2
    elsif @type_of_turn == :war
      @winner = @player2
    else
      "No Winner"
    end
  end

end
