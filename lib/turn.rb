class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutally_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
     :war
   else
     :basic
    end
  end

  def winner
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) == true
      return @player1
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0) == true
      return @player2
    end
  end

  def pile_cards
    cards = [@player1.deck.cards.delete_at(0),  @player2.deck.cards.delete_at(0)]
    cards.each do |card|
      @spoils_of_war.push(card)
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |spoil|
      winner.deck.cards.push(spoil)
    end
  end
end
