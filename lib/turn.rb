class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
    return :basic
  end

  def winner
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      player1
    else @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      player2
    end
  end

  def pile_cards

  end
end
