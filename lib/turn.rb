class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = nil
  end

  def type
    type = nil
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      type = :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      type = :war
    else
      type = :basic
    end
  end

  def winner?
    self.type
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = @player1
        "player1"
      else
        @winner = @player2
        "player2"
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = @player1
        "player1"
      else
        @winner = @player2
        "player2"
      end
    else
      "No Winner"
    end
  end

  def pile_cards
    self.type
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :war
      3.times {@spoils_of_war << @player1.deck.remove_card}
      3.times {@spoils_of_war << @player2.deck.remove_card}
    else
      3.times {@player1.deck.remove_card}
      3.times {@player2.deck.remove_card}
    end
  end

  def award_spoils(recipient)
      @spoils_of_war.each {|card| recipient.deck.add_card(card)}
  end

end
