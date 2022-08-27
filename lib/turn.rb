class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_type = nil
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if @turn_type = :basic
      @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2
    elsif @turn_type = :war
      @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
      @player2
    elsif @turn_type = :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    elsif type == :war
      @spoils_of_war << @player1.deck.cards.shift(3)
      @spoils_of_war << @player2.deck.cards.shift(3)
      @spoils_of_war.flatten!
    elsif type == :basic
      @spoils_of_war << @player1.deck.cards.shift()
      @spoils_of_war << @player2.deck.cards.shift()
    end
  end

  def award_spoils
    a = @spoils_of_war.length
    a.times do
      winner.deck.cards << @spoils_of_war.shift
    end
  end
end
