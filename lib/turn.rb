class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    return :mutually_assured_destruction if
      @player1.deck.rank_of_card_at(0) ==
      @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    return :war if
      @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
    return :basic if
      @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    else
      'No Winner'
    end
  end

#destruction
# @player1.deck.cards.drop(3) && @player2.deck.cards.drop(3)

  def pile_cards
    if type == :basic
      @spoils_of_war << (@player1.deck.cards.shift)
      @spoils_of_war << (@player2.deck.cards.shift)
    elsif type == :war
      player1_type_war && player1_type_mad
      player2_type_war && player2_type_mad
      @spoils_of_war.flatten!
    elsif type == :mutually_assured_destruction
      player1_type_mad
      player2_type_mad
    end

  end

  def award_spoils(winner)
    if type == :basic || type == :war
      if winner == player1
        spoils_of_war.map {|card|
          player1.deck.cards << card}
        spoils_of_war.clear
      else
        spoils_of_war.map {|card|
          player2.deck.cards << card}
        spoils_of_war.clear
      end
    else
    end
  end

#helper methods


  def player1_type_war
    @spoils_of_war << @player1.deck.cards[0..2]
  end

  def player2_type_war
    @spoils_of_war << @player2.deck.cards[0..2]
  end

  def player1_type_mad
    3.times do
      @player1.deck.cards.shift
    end
  end

  def player2_type_mad
    3.times do
      @player2.deck.cards.shift
    end
  end

end
