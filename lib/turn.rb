class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    first_pair_matches = @player1.deck.cards[0].rank === @player2.deck.cards[0].rank
    second_pair_matches = @player1.deck.cards[2].rank === @player2.deck.cards[2].rank
    if (first_pair_matches && second_pair_matches)
      return :mutually_assured_destruction
    elsif (first_pair_matches)
      return :war
    else
      return :basic
    end
  end
end
