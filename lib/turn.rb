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

    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
        "No Winner"
    elsif type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    else
      @player2
    end
  end

  def pile_cards
    # type = type
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card


    elsif type == :war
      i = 0
      while i < 3
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
        i += 1
      end

    else
      j = 0
      while j < 3
        @player1.deck.remove_card
        @player2.deck.remove_card
        j += 1
      end
    end
  end

  def award_spoils(winner)
    # winning_player = winner
    # type = type
    if type != :mutually_assured_destruction
      @spoils_of_war.each do |card|
        winner.deck.cards << card
        end
    else
      @award_spoils = []
    end
  end
end
