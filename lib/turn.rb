require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type, :winner
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type
    @winner
  end

  def type
    # player1_card1 = @player1.deck.rank_of_card_at(0)
    # player2_card1 = @player2.deck.rank_of_card_at(0)
    # player1_card3 = @player1.deck.rank_of_card_at(2)
    # player2_card3 = @player2.deck.rank_of_card_at(2)
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @type = :basic
    else
      if @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        @type = :mutually_assured_destruction
      else
        @type = :war
      end
    end
  end

  def winner
    if @type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = @player1
      else
        @winner = @player2
      end
    elsif @type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = @player1
      else
        @winner = @player2
      end
     else #@type = :mutually_assured_destruction
      return 'No Winner'
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
    end
    # elsif @type == :war
    # else
  end

#spoils of war equals an empty array even
  def award_spoils
  end


  # def winner
  #   if @type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
  #     @winner = @player1
  #   elsif @type == :basic && @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
  #   end
  # end
end
