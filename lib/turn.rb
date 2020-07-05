require './lib/deck'
require './lib/card'
require './lib/player'

class Turn
attr_reader :player1, :player2, :spoils_of_war, :type, :victor

  def initialize(player1_param, player2_param)
    @player1 = player1_param
    @player2 = player2_param
    @spoils_of_war = []
  end

  # def conditional_setup
  #   @equal_condition1 = @player1.deck.rank_of_card_at(0) ==  @player2.deck.rank_of_card_at(0)
  #   @equal_condition2 = @player1.deck.rank_of_card_at(2) ==  @player2.deck.rank_of_card_at(2)
  #   @p1_nil_condition2 = (@player1.deck.cards[2] == nil)
  #   @p2_nil_condition2 = (@player2.deck.cards[2] == nil)
  #   @p1_nil_deck = @player1.deck == []
  #   @p2_nil_deck = @player2.deck == []
  # end

  def type

    if @player1.deck.cards[0].rank ==  @player2.deck.cards[0].rank && @player1.deck.cards[2].rank ==  @player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      :war
    elsif @player1.deck.cards[0].rank ==  @player2.deck.cards[0].rank && ((@player1.deck.cards[2] == nil) || (@player2.deck.cards[2]== nil))
      if @player2.deck.cards[2] == nil
        @player2.has_lost? == true
      else @player1.has_lost? == true
      end
    else
      :basic
    end
  end

  def card_comparitor (index)
    if @player1.deck.rank_of_card_at(index) > player2.deck.rank_of_card_at(index)
      @player1
    elsif @player1.deck.cards[index].rank < player2.deck.cards[index].rank
      @player2
    else
      "No Winner"
    end
  end

  def winner
    if type == :war
      @winner = card_comparitor(2)
    elsif type == :mutually_assured_destruction
      "No Winner"
      return nil
    else @winner = card_comparitor(0)
    end
  end


  def pile_cards

    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war = @spoils_of_war.shuffle!

    elsif type == :war
      3.times {@spoils_of_war << @player1.deck.remove_card}
      3.times {@spoils_of_war << @player2.deck.remove_card}

    else
      3.times {@player1.deck.cards.delete_at(0)}
      3.times {@player2.deck.cards.delete_at(0)}
    end

  end

  def award_spoils
    @winner.deck.cards.concat(@spoils_of_war)
    @spoils_of_war = []
  end

  def game_over
    if @player1.has_lost? == true || @player2.has_lost? == true
      true
    else
      false
    end
  end


end
