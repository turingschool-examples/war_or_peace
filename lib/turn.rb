class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2, spoils_of_war = [])
    @player1 = player1
    @player2 = player2
    @spoils_of_war = spoils_of_war
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      turn_type = :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      turn_type = :war
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.rank_of_card_at(2) == @player2.rank_of_card_at(2)
      turn_type = :mutually_assured_destruction
    else
      turn_type = :invalid
    end
    turn_type
  end
end
