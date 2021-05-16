class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    # (suit, value, rank) => card1(s,v,r) => deck1([1,2,5,8]) =>
    #   player1(name, deck1) => turn(p1, p2)
    p1 = @player1.deck
    p2 = @player2.deck
    if p1.rank_of_card_at(0) == p2.rank_of_card_at(0)
      :war
    # if p1.rank_of_card_at(0,2) == p2.rank_of_card_at(0,2)
    #   :mutually_assured_destruction
    # elsif p1.rank_of_card_at(0) == p2.rank_of_card_at(0)
    #   :war
    # else p1.rank_of_card_at(0) != p2.rank_or_card_at(0)
    #   :basic
    end
  end
  # => :basic, :war, OR :mutually_assured_destruction

  def winner
  end

  def pile_cards
  end

  def award_spolis
  end

end
