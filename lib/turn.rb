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

  def type
    @type = :type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @type = :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      @type = :war
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      @type = :mutually_assured_destruction
    end
    return @type
  end

  def winner
    if @type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif @type == :basic && @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2
    elsif @type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    elsif @type == :war && @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
      @player2
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

  def award_spoils
    if @winner == @player1
      @spoils_of_war.each do |card|
        @player1.deck.add_card(card)
      end
    elsif @winner == @player2
      @spoils_of_war.each do |card|
        @player2.deck.add_card(card)
      end
    end
  end

end
