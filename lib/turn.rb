require './lib/deck'
require './lib/card'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type, :victor

  def initialize(player1_param, player2_param)
    @player1 = player1_param
    @player2 = player2_param
    @spoils_of_war = []
    @loser_cards = Deck.new([])
    @loser = Player.new('No Winner', @loser_cards)
  end

  def war_nil_at_2
    if @player2.deck.cards[2] == nil
      @player2.has_lost = true
    else @player1.has_lost = true
    end
  end

  def war_or_MAD
    if (@player1.deck.cards[2] == nil) || (@player2.deck.cards[2]== nil)
      war_nil_at_2
    elsif @player1.deck.cards[2].rank ==  @player2.deck.cards[2].rank
      :mutually_assured_destruction
    else :war
    end
  end

  def initial_nil
    if @player1.deck.cards.count > @player2.deck.cards.count
      @player2.has_lost = true
    else @player1.has_lost = true
    end
  end

  def type
    if (@player1.deck.cards[0] == nil) || (@player2.deck.cards[0]== nil)
      initial_nil
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      war_or_MAD
    else
      :basic
    end
  end

  def card_comparitor (index)
    if @player1.deck.cards[index].rank > player2.deck.cards[index].rank
      @player1
    elsif @player1.deck.cards[index].rank < player2.deck.cards[index].rank
      @player2
    else
      @loser
    end
  end

  def winner
    if type == :war
      @winner = card_comparitor(2)
    elsif type == :basic
      @winner = card_comparitor(0)
    else @winner = @loser
    end
  end


  def pile_cards

    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card


    elsif type == :war
      3.times {@spoils_of_war << @player1.deck.remove_card}
      3.times {@spoils_of_war << @player2.deck.remove_card}

    else
      3.times {@player1.deck.cards.delete_at(0)}
      3.times {@player2.deck.cards.delete_at(0)}
    end
    @spoils_of_war = @spoils_of_war.shuffle!
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
