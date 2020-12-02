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
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    end
  end

  def winner
    result_of_type = self.type
    player1_rank = @player1.deck.rank_of_card_at(0)
    player2_rank = @player2.deck.rank_of_card_at(0)
    if result_of_type == :basic
      if player1_rank > player2_rank
        return player1
      else
        return player2
      end
    end
  end
end
