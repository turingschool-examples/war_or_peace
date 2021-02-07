require './lib/deck'
require './lib/card'
require './lib/player'

class Turn

  attr_reader :player1,
  :player2,
  :type,
  :winner

  attr_accessor :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @type = determine_type
    @winner = determine_winner
    @spoils_of_war = []
  end

  def determine_type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
      @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
       :mutually_assured_destruction

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end



  def determine_winner
    if @player1.deck.rank_of_card_at(2) == nil
      @player2
    elsif @player2.deck.rank_of_card_at(2) == nil
      @player1
    elsif @type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif @type == :basic && @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
      @player2
    elsif @type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    elsif @type == :war && @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
      @player2
    elsif @type == :mutually_assured_destruction
      "No Winner"
    end
  end


   def pile_cards
    if @type == :basic
      @spoils_of_war.concat(@player1.deck.cards.shift(1))
      @spoils_of_war.concat(@player2.deck.cards.shift(1))
    elsif @type == :war
      @spoils_of_war.concat(@player1.deck.cards.shift(3))
      @spoils_of_war.concat(@player2.deck.cards.shift(3))
    else
     @player1.deck.cards.shift(3)
     @player2.deck.cards.shift(3)
    end
  end



  def award_spoils(winner)
    if @type == :mutually_assured_destruction
         @spoils_of_war = []
    else
      #@spoils_of_war.shuffle
       @spoils_of_war.each do |card|
         winner.deck.cards << card
      end
    end

  end

end
