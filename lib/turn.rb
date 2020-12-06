class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1_obj, player2_obj)
    @player1 = player1_obj
    @player2 = player2_obj
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    else
      :war
    end
  end

  def winner
    if type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif type == :basic && @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2
    elsif type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    elsif type == :war && @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
      @player2
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type == :war
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type == :mutually_assured_destruction
      @player1.deck.cards.shift
      @player1.deck.cards.shift
      @player1.deck.cards.shift
      @player2.deck.cards.shift
      @player2.deck.cards.shift
      @player2.deck.cards.shift
    end
  end

  def award_spoils(player_obj)
    @spoils_of_war.each do |card|
      player_obj.deck.cards << card
    end
  end
end