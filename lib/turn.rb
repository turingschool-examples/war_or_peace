class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return :mutally_assured_destruction
    end
  end

  def winner

    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      player1
    else
      player2
    end
  end

  def pile_cards(pile)
    @cards[0]
    @spoils_of_war << pile
  end

end
