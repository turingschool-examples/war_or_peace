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
    if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
       :basic
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
       :war
    end
  end

  def winner
    if self.type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        @player1
      elsif @player1.deck.cards[0].rank < @player2.deck.cards[0].rank
        @player2
      end

    elsif self.type == :war
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        @player1
      elsif @player1.deck.cards[2].rank < @player2.deck.cards[2].rank
        @player2
      end

    elsif self.type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]

      @player1.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(0)
    elsif self.type == :war
      @spoils_of_war << @player1.deck.cards[0..2]
      @spoils_of_war << @player2.deck.cards[0..2]

      @player1.deck.cards.slice!(0..2)
      @player2.deck.cards.slice!(0..2)

    elsif self.type == :mutually_assured_destruction
      @player1.deck.cards.slice!(0..2)
      @player2.deck.cards.slice!(0..2)
    end
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war
    winner.deck.cards = winner.deck.cards.flatten
  end
end
