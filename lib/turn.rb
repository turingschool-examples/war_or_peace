class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def winner
    p1_card = @player1.deck.rank_of_card_at(0)
    p2_card = @player2.deck.rank_of_card_at(0)

    if p1_card > p2_card

      return @player1
    elsif p2_card > p1_card

      return @player2
    end
  end
end
