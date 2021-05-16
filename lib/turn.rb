class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner
 def initialize(player1, player2)
   @player1 = player1
   @player2 = player2
   @spoils_of_war = []
   @winner = nil
 end

 def pile_cards
   @spoils_of_war.basic << @player1.deck.rank_of_card_at(0) && @player2.deck.rank_of_card_at(0)
   @spoils_of_war.war << @player1.deck.rank_of_card_at(0, 1, 2) && @player2.deck.rank_of_card_at(0, 1, 2)
   @spoils_of_war.mutually_assured_destruction << @player1.deck.rank_of_card_at(0, 1, 2).shift && @player2.deck.rank_of_card_at(0, 1, 2).shift
 end

 def type
  if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @winner = @player1
    else
      @winner = @player2
    end
    :basic
  elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    @winner = "No Winner"
    :mutually_assured_destruction
  else
    if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @winner = @player1
    else
      @winner = @player2
    end
    :war
  end
 end

end
