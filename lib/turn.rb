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
    return :mutually_assured_destruction if destruction
    return :war if war
    return :basic if basic

  end

  def destruction
    @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
  end

  def war
    @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
  end

  def basic
    @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
  end

    # if  @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
    #   :basic
    # elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    #   :mutually_assured_destruction
    # else
    #   :war
    #
    # end
  # end

  def winner
    return "No Winner" if type == :mutually_assured_destruction
    return @player1 if type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
    return @player2 if type == :war && @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
    return @player1 if type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
    return @player2 if type == :basic && @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
  end

  def pile_cards

    if type == :mutually_assured_destruction
      3.times {@player1.deck.remove_card}
      3.times {@player2.deck.remove_card}
    elsif type == :war
      3.times {
        @spoils_of_war << @player1.deck.remove_card}
      3.times {
        @spoils_of_war << @player2.deck.remove_card}
    else type == :basic
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
    end
  end


  def award_spoils(winner)
    @spoils_of_war.each do |spoil|
      winner.deck.cards << spoil
    end
    @spoils_of_war = []
  end

#helper methods



end
