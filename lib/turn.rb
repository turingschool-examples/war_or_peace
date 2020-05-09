class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner
    if self.type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      elsif @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
        @player2
      end
    # elsif self.type == :war
    #   if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
    #     player1
    #   elsif @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
    #     player2
    #   end
    # elsif self.type == :mutually_assured_destruction
    #   "No winner"
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    # elsif self.type == :war
        # @spoils_of_war << @player1.deck.cards.slice!(0..2)
        # @spoils_of_war << @player2.deck.cards.slice!(0..2)
    # elsif self.type == :mutually_assured_destruction
    #   @player1.deck.cards.shift(3)
    #   @player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner_param)
    winner_param.deck.cards.concat(@spoils_of_war)
    @spoils_of_war.clear
  end
end
