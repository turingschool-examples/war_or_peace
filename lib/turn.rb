class Turn
  attr_reader :spoils_of_war, :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (@player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0))
      return :basic
    end

    if @player1.deck.cards.length < 3 || @player2.deck.cards.length < 3
      return :not_enough_cards
    end

    if (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    else
      :war
    end
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
    elsif type == :not_enough_cards
      if @player1.deck.cards.length < 3
        @player2
      else
        @player1
      end
    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card

    elsif type == :war
      3.times {@spoils_of_war << @player1.deck.remove_card}
      3.times {@spoils_of_war << @player2.deck.remove_card}

    elsif type == :mutually_assured_destruction
      3.times {@player1.deck.remove_card}
      3.times {@player2.deck.remove_card}

    elsif type == :not_enough_cards
      if winner == @player1
        until @player2.deck.cards.length == 0
          @spoils_of_war << @player2.deck.remove_card
        end
      elsif winner == @player2
        until @player1.deck.cards.length == 0
          @spoils_of_war << @player1.deck.remove_card
        end
      end
    end
  end

  def award_spoils(winner, type)
    unless type == :mutually_assured_destruction
      @spoils_of_war.each do |card|
        winner.deck.add_card(card)
      end
    end
  end
end
