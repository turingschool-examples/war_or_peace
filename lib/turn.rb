require 'pry'

class Turn

  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def turn_is_basic?
    @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
  end

  def turn_is_war?
    @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
    @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
  end

  def turn_is_mad?
    @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
    @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
  end

  def type
    if turn_is_basic?
      @type = :basic
    elsif turn_is_war?
      @type = :war
    elsif turn_is_mad?
      @type = :mutually_assured_destruction
    end
  end

  def basic_winner
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    else
      @player2
    end
  end

  def war_winner
    if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    else
      @player2
    end
  end

  def winner
    if @type == :basic
      basic_winner
    elsif @type == :war
      war_winner
    elsif @type == :mutually_assured_destruction
      "No Winner."
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif @type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    elsif @type == :mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
  end

end
