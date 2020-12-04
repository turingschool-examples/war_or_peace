class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1_obj, player2_obj)
    @player1 = player1_obj
    @player2 = player2_obj
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    else
      @player2
    end

  end
end