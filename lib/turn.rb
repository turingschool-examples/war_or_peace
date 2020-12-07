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
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      if @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
        return :war
      else
        return :mutually_assued_destruction
      end
    end
  end

  def winner
    player1_rank_0 = @player1.deck.rank_of_card_at(0)
    player2_rank_0 = @player2.deck.rank_of_card_at(0)
    player1_rank_2 = @player1.deck.rank_of_card_at(2)
    player2_rank_2 = @player2.deck.rank_of_card_at(2)

    if self.type == :basic
      if player1_rank_0 > player2_rank_0
        return @player1
      else
        return @player2
      end
    elsif self.type == :war
      if player1_rank_2 > player2_rank_2
        return @player1
      else
        return @player2
      end
    else
      return "No Winner"
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif self.type == :war
      @spoils_of_war << @player1.deck.cards.shift(3)
      @spoils_of_war << @player2.deck.cards.shift(3)
      @spoils_of_war = @spoils_of_war.flatten
    else
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    #begin test line
    # @spoils_of_war = @spoils_of_war.shuffle
    #end test line
    @spoils_of_war.each do |card|
      winner.deck.cards << card
    end
    @spoils_of_war = []
  end
end
