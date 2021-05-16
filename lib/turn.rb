class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if deck1.rank_of_card_at(0,2) == deck2.rank_of_card_at(0,2)
      :mutually_assured_destruction
    elsif deck1.rank_of_card_at(0) == deck2.rank_of_card_at(0)
      :war
    else deck1.rank_of_card_at(0) != deck2.rank_or_card_at(0)
      :basic
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
