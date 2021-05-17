class Turn
  attr_reader :player1, :player2, :type, :spoils_of_war

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

  def winner # if one player has only 1 card, less than 3, etc.
    if self.type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    elsif self.type == :war && (@player1.deck.length > 3 && @player2.deck.length > 3)
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
    if type == :basic
      # require "pry"; binding.pry
      # undefined method `remove_card' for #<Array:0x00007fb0078b4480> (NoMethodError)
      deck1_minus1 = @player1.deck.remove_card
      @spoils_of_war << deck1_minus1

      deck2_minus1 = @player2.deck.remove_card
      @spoils_of_war << deck2_minus1
      # require "pry"; binding.pry
    elsif type == :war
      3.times {@spoils_of_war << @player1.deck.remove_card}
      3.times {@spoils_of_war << @player2.deck.remove_card}
      # require "pry"; binding.pry
    else
      3.times {@player1.deck.remove_card}
      3.times {@player2.deck.remove_card}
      # require "pry"; binding.pry
    end
  end

  def award_spoils(winner)
      @spoils_of_war.map do |card|
        winner.deck.cards << card
      end
      @spoils_of_war = []
  end
end
