class Turn
  attr_reader   :player1,
                :player2,
                :spoils_of_war,
                :type

  def initialize(player1, player2)
    @player1        = player1
    @player2        = player2
    @spoils_of_war  = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      @type = :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      @type = :war
    else
      @type = :basic
    end
    return @type
  end

  def winner
    if @type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return player1
      else
        return player2
      end
    end

    if @type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return player1
      else
        return player2
      end
    end

    if @type == :mutually_assured_destruction
      return "No winner"
    end
  end
end
