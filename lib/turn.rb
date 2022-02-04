class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    #do stuff[
    @spoils_of_war = []
    @player1 = player1
    @player2 = player2
  end

  def type()
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @type = :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      @type = :mutually_assured_destruction
    else
      @type = :war
    end
  end

  def winner ()
    if type() == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    elsif type() == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    else
      return "No Winner"
    end
  end

  def pile_cards ()
    #piles cards in @spoils_of_war
  end

  def award_spoils()
    #give the spoils to the winner
  end
end
