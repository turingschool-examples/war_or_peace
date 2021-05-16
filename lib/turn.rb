# frozen_string_literal: true

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :player1_win_count, :player2_win_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @player1_win_count = 0
    @player2_win_count = 0
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
    # Case statement
    case type
    when :basic
      # Ternary operator
      first_card(@player1) > first_card(@player2) ? @player1 : @player2
    when :war
      third_card(@player1) > third_card(@player2) ? @player1 : @player2
    else
      'No Winner'
    end
  end

  def pile_cards
    case type
    when :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    when :war
      @spoils_of_war.concat(@player1.deck.cards.shift(3))
      @spoils_of_war.concat(@player2.deck.cards.shift(3))
    when :mutually_assured_destruction
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    if winner == @player1
      @player1.deck.cards.concat(@spoils_of_war)
      @player1_win_count += 1
    elsif winner == @player2
      @player2.deck.cards.concat(@spoils_of_war)
      @player2_win_count += 1
    end
    @spoils_of_war = []
  end

  # Helper Methods
  def first_card(player)
    player.deck.rank_of_card_at(0)
  end

  def third_card(player)
    player.deck.rank_of_card_at(2)
  end
end
