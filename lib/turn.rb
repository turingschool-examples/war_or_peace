class Turn
  attr_accessor :player1, :player2, :spoils_of_war, :winner
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
  end

  def type
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      return :mutally_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner?
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @winner = @player1
      else
        @winner = @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @winner = @player1
      else
        @winner = @player2
      end
    elsif type == :mutally_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :mutally_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    elsif type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    elsif type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    if @spoils_of_war.length != 0
      (winner.deck.cards << @spoils_of_war).flatten
      @spoils_of_war.clear
    else
      @spoils_of_war.clear
    end
  end
end
