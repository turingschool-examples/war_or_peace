class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0)    == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else  @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner_basic
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    else @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2
    end
  end

  def winner_war
    if  @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
    else @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        @player2
    end
  end

  def winner
    if  type   == :basic
      winner_basic
    elsif type == :war
      winner_war
    else  type == :mutually_assured_destruction
       p "No Winner"
    end
  end

  def pile_cards_basic
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
  end

  def pile_cards_war
    a = @spoils_of_war << @player1.deck.cards.slice!(0..2)
    b = @spoils_of_war << @player2.deck.cards.slice!(0..2)
    a.flatten!
    b.flatten!
  end

  def pile_cards
    if    type == :basic
      pile_cards_basic
    elsif type == :war
      pile_cards_war
    else  type == :mutually_assured_destruction
    @player1.deck.cards.slice!(0..2)
    @player2.deck.cards.slice!(0..2)
    end
  end

  def award_spoils(winner)
    a = winner.deck.cards << @spoils_of_war.slice!(0..5)
    a.flatten!
  end
end
