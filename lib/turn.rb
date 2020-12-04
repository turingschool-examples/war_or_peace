class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      return :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      return :war
    else
      return :basic
    end
  end

  def winner
    if type() == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        return @player1
      else return @player2
      end
    end

    if type() == :war
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        return @player1
      else return @player2
      end
    end
  end
end
