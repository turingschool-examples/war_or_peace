class Turn
 attr_reader  :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction

    elsif (@player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0))
      :basic

    else (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0))
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
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards[0]
        @player1.deck.remove_card
      @spoils_of_war << @player2.deck.cards[0]
        @player2.deck.remove_card

    elsif type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end

    else type == :mutually_assured_destructionub
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end

    end

  end

  def award_spoils(winner)
    if winner.is_a?(String)
      @spoils_of_war = []
    else
      @spoils_of_war.each do |spoil|
        winner.deck.cards << spoil
      end
      @spoils_of_war = []
    end
  end

end
