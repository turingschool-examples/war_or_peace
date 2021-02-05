require './lib/deck'
require './lib/card'
require './lib/player'

class Turn

  attr_reader :player1,
  :player2,
  :spoils_of_war


  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @type = type
    @winner = winner
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
      @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
       :mutually_assured_destruction

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end



  def winner
    if @type == :basic
      #ternary operater, uses ? then True: False
      comparison = @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      comparison ? @player1 : @player2
    elsif @type == :war
      comparison = @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      comparison ? @player1 : @player2
    else
      "No Winner"
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif @type == :war
      @spoils_of_war << @player1.deck.cards.shift(3)
      @spoils_of_war << @player2.deck.cards.shift(3)
    else
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
       if @type == :mutually_assured_destruction
         @spoils_of_war = []
       else
         @spoils_of_war.each do |card|
           winner.deck.cards.concat(@spoils_of_war) << card
         end
       end
  end
end
