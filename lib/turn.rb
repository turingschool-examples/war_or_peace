require 'pry'
class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_type = nil
    @winner = nil
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @turn_type = :basic
    elsif player1.rank_of_card_at(0) == player2.rank_of_card_at(0) && player1.rank_of_card_at(0) == player2.rank_of_card_at[2]
      @turn_type = :mutually_assured_destruction
    elsif player1.rank_of_card_at(0) == player2.rank_of_card_at(0)
      @turn_type = :war
    end
  end

  def winner
    if @turn_type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      @winner = player1
    elsif @turn_type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      @winner = player1
    elsif @turn_type == :mutually_assured_destruction
      @winner = "No Winner"
    else
      @winner = player2
    end
  end

  def pile_cards
    if @turn_type == :basic
      @spoils_of_war << (player1.deck.cards.shift)
      @spoils_of_war << (player2.deck.cards.shift)
    end
  end

  def award_spoils
    if @winner == player1
      player1.deck.cards << @spoils_of_war
    else
      player2.deck.cards << @spoils_of_war
    end
  end
end
