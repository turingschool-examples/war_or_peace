class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = type
  end

  def type
    if p1_card.deck.rank_of_card_at(0) != p2_card.deck.rank_of_card_at(0)
      @type = :basic
    elsif p1_card.deck.rank_of_card_at(0) == p2_card.deck.rank_of_card_at(0)
      @type = :war
    elsif p1_card.deck.rank_of_card_at(0) == p2_card.deck.rank_of_card_at(0) && p1_card.deck.rank_of_card_at(2) == p2_card.deck.rank_of_card_at(2)
      @type = :mutually_assured_destruction
    end
  end

  def winner
    p1_card = @player1.deck.rank_of_card_at()
    p2_card = @player2.deck.rank_of_card_at()

    if p1_card > p2_card
     return @player1
    elsif p2_card > p1_card
      return @player2
    end

    def pile_cards
    end

    def award_spoils
      turn.winner << @spoils_of_war
    end

  end
end
