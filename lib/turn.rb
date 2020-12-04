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
    if mutually_assured_destruction?
      :mutually_assured_destruction
    elsif war?
      :war
    elsif basic?
      :basic
    else
      # ??
    end
  end

  def winner
    if type == :basic
      player_with_highest_card_at(0)
    elsif type == :war
      player_with_highest_card_at(2)
    elsif type == :mutually_assured_destruction
      "No Winner"
    else
      # ??
    end
  end

  private

  def basic?
    @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
  end

  def war?
    @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
  end

  def mutually_assured_destruction?
    if @player1.deck.cards.length > 2 && @player2.deck.cards.length > 2
      @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    else
      false
    end
  end

  def player_with_highest_card_at(index)
    player1_card_rank = @player1.deck.rank_of_card_at(index)
    player2_card_rank = @player2.deck.rank_of_card_at(index)

    if player1_card_rank == player2_card_rank
      nil
    elsif player1_card_rank > player2_card_rank
      @player1
    else
      @player2
    end
  end
end
