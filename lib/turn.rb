class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
     :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
     :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
     :war
    end
  end

  def winner
    type = type()
    if type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      player1
    elsif type == :basic && @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      player2
    elsif type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      player1
    elsif type == :war && @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
      player2
    elsif type == :mutually_assured_destruction && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      "No Winner"
    end

  #   if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
  #     player1
  #   else
  #     player2
  #   end
  #   :war
  end

  def pile_cards
    binding.pry 
    spoils_of_war = spoils_of_war[]
    if turn.type == :basic
      spoils_of_war << deck1.delete_at[0] && deck2.delete_at[0]
    elsif turn.type == :war
      spoils_of_war << deck1.delete_at[0..2] && deck2.delete_at[0..2]
    elsif turn.type == :mutually_assured_destruction
      spoils_of_war << deck.delete_at[0..2] && deck2.delete_at[0..2]
    end
  end

end
