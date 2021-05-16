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
     return :basic
    elsif p1_card.deck.rank_of_card_at(0) == p2_card.deck.rank_of_card_at(0)
      return :war
    elsif p1_card.deck.rank_of_card_at(0) == p2_card.deck.rank_of_card_at(0) && p1_card.deck.rank_of_card_at(2) == p2_card.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
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
  end

  def pile_cards                                #correct?
    if :basic
      @spoils_of_war << @player1.deck.shift
      @spoils_of_war << @player2.deck.shift
    elsif :war
      @spoils_of_war << @player1.deck.drop(3)
      @spoils_of_war << @player2.deck.drop(3)
    elsif :mutually_assured_destruction
      @player1.deck.drop(3)
      @player2.deck.drop(3)
    end

  end

  def award_spoils
      turn.winner << @spoils_of_war  #correct?
  end

  end
end
