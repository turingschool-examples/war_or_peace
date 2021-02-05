class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
      "No Winner"
    elsif type == :basic
      who_won(0)
    else
      who_won(2)
    end
  end

  def who_won(index)
    if player1.deck.rank_of_card_at(index) > player2.deck.rank_of_card_at(index)
      player1
    else
      player2
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.lose_card
      @spoils_of_war << player2.lose_card
    elsif type == :war
      3.times {@spoils_of_war << player1.lose_card}
      3.times {@spoils_of_war << player2.lose_card}
    else
      3.times {player1.lose_card; player2.lose_card}
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each {|spoil| winner.deck.add_card(spoil)}
  end

end
