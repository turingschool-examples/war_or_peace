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

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :mutually_assured_destruction
    end
  end

  def winner
   if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
     return player1
   elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
     return player2
    end
  end

  def pile_cards
    @spoils_of_war << player1.deck.remove_card
    @spoils_of_war << player2.deck.remove_card
  end
end
