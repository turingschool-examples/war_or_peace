require 'pry'

class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
        :basic
    else #@player1.deck[0] == @player2.deck[0]
      if @player1.deck.cards[2].rank != @player2.deck.cards[2].rank
        :war
      else #@player1.deck[2] == @player2.deck[2]
        :mutually_assured_destruction
      end
    end
  end

  def winner
    if type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        @player1
      else
        @player2
      end
    elsif type == :war
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        @player1
      else
        @player2
      end
    else type == :mutually_assured_destruction
      "No winner"
    end
  end

  def pile_cards #ACTION METHOD
    if type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player1.deck.cards[1]
      @spoils_of_war << @player1.deck.cards[2]
      @spoils_of_war << @player2.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[1]
      @spoils_of_war << @player2.deck.cards[2]
    end
  end

  def award_spoils (winner)
    if type == :basic || type == :war
      if turn.winner == @player1
        @player1.deck.cards << @spoils_of_war
      else
        @player2.deck.cards << @spoils_of_war
      end
    end
  end
end
