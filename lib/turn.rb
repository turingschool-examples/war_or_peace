class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(p1, p2)
    @player1       = p1
    @player2       = p2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0)   != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :mutually_assured_destruction
    end
  end

  def winner
    if type   == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if  @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
          @player1
      else
          @player2
        end
    else
        puts "No Winner"
    end
  end

  def pile_cards
    if    type == :basic
    a = @spoils_of_war << @player1.deck.remove_card
    b = @spoils_of_war << @player2.deck.remove_card
    a + b
    elsif type == :war
    a = @spoils_of_war << 3.times{@player1.deck.remove_card}
    b = @spoils_of_war << 3.times{@player2.deck.remove_card}
    a + b
    else
      a = 3.times{@player1.deck.remove_card}
      b = 3.times{@player2.deck.remove_card}
      a + b
    end
  end

end
