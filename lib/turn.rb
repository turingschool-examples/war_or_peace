

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :player1_rank, :player2_rank

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_rank_0 = player1.deck.rank_of_card_at(0)
    @player2_rank_0 = player2.deck.rank_of_card_at(0)
    @spoils_of_war = []
  end

  def type
    if @player1_rank_0 != @player2_rank_0
      :basic
    elsif @player1_rank_0 == @player2_rank_0
      :war
    elsif @player1_rank_0 == @player2_rank_0 && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      if @player1_rank_0 > @player2_rank_0
        return @player1
      elsif @player1_rank_0 < @player2_rank_0
        return @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        return @player2
      end
    elsif type == :mutually_assured_destruction
      return 'No Winner'
    end
  end

    def pile_cards
      if type == :basic
        @spoils_of_war << @player1.deck.cards[0]
        @spoils_of_war << @player2.deck.cards[0]
      elsif type == :war
        @spoils_of_war << @player1.deck.cards[0]
        @spoils_of_war << @player1.deck.cards[1]
        @spoils_of_war << @player1.deck.cards[2]

        @spoils_of_war << @player2.deck.cards[0]
        @spoils_of_war << @player2.deck.cards[1]
        @spoils_of_war << @player2.deck.cards[2]
    elsif type == :mutually_assured_destruction
        @player1.deck.cards.delete_at(0, 1, 2)
        @player2.deck.cards.delete_at(0, 1, 2)
    end
  end
    def award_spoils(winner)
      if @player1_rank_0 > @player2_rank_0
        return @player1
      else
        return @player2
      end
    end
end
