class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) &&
      ((@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)))
      return :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war
    else
      return :basic
    end
  end

  def winner
    if self.type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    elsif self.type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    else
      return "No Winner"
    end
  end

  def pile_cards
    if type = :basic
      # undefined method `remove_card' for #<Array:0x00007fb0078b4480> (NoMethodError)
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type = :war
      3.times {@spoils_of_war << @player1.deck.remove_card}
      3.times {@spoils_of_war << @player2.deck.remove_card}
    else
      3.times {@player1.deck.remove_card}
      3.times {@player2.deck.remove_card}
    end
  end

  def award_spoils(winner)
      @spoils_of_war.map do |card|
        winner.deck.cards << card
      end
  end
end
