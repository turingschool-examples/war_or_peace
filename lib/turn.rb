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

  def pile_cards
    if type() == :basic
      #@spoils_of_war << @player1.deck.cards[0]
      #@spoils_of_war << @player2.deck.cards[0]
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type() == :war
      # shoveling multiple items into the array at once
      # eg. @spoils_of_war << @player1.deck.cards[0..2]
      # was giving me problems. Should come back to this.
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    else
      @player1.deck.cards.delete_at(0)
      @player1.deck.cards.delete_at(0)
      @player1.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(0)
    end
  end

  def reward_spoils(winner)
    spoils_of_war.each do |card|
      winner.deck.cards << card
    end
  end
end
