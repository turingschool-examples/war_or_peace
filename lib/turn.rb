# frozen_string_literal: true

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if first_card(@player1) == first_card(@player2) && third_card(@player1) == third_card(@player2)
      :mutually_assured_destruction
    elsif first_card(@player1) == first_card(@player2) && third_card(@player1) != third_card(@player2)
      :war
    else
      :basic
    end
  end

  def winner
    case type
    when :basic
      first_card(@player1) > first_card(@player2) ? @player1 : @player2
    when :war
      third_card(@player1) > third_card(@player2) ? @player1 : @player2
    else
      'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      @spoils_of_war.concat(player1.deck.cards.shift(3))
      @spoils_of_war.concat(player2.deck.cards.shift(3))
    elsif type == :mutually_assured_destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    if winner == @player1
      @player1.deck.cards << @spoils_of_war
    elsif winner == @player2
      @player2.deck.cards << @spoils_of_war
    end
  end

  # helper methods
  def first_card(player)
    player.deck.rank_of_card_at(0)
  end

  def third_card(player)
    player.deck.rank_of_card_at(2)
  end
end
