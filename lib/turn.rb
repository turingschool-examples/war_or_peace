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
    elsif @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2) == true
      return @player1
    elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2) == true
      return @player2
    else
      return "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      cards = [@player1.deck.cards.delete_at(0),  @player2.deck.cards.delete_at(0)]
      cards.each do |card|
        @spoils_of_war.push(card)
      end
    elsif type == :war
      cards = [@player1.deck.cards.shift, @player1.deck.cards.shift, @player1.deck.cards.shift, @player2.deck.cards.shift, @player2.deck.cards.shift, @player2.deck.cards.shift]
      cards.each do |card|
        @spoils_of_war.push(card)
      end
    elsif type == :mutally_assured_destruction
      cards = [@player1.deck.cards.shift, @player1.deck.cards.shift, @player1.deck.cards.shift, @player2.deck.cards.shift, @player2.deck.cards.shift, @player2.deck.cards.shift]
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |spoil|
      winner.deck.cards.push(spoil)
    end
  end
end
