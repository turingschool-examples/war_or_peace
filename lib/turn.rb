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
    else
      if @player1.deck.cards[2].rank != @player2.deck.cards[2].rank
        :war
      else
        :mutually_assured_destruction
      end
    end
  end

  def start
    # p "Welcome to War! (or Peace) This game will be played with 52 cards.
    #   The players today are Megan and Aurora.
    #   Type 'GO' to start the game!
    #   ------------------------------------------------------------------"
    # p "=> (type 'GO' when you are ready for WAR!)"
    # p gets.chomp
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
      @player1.deck.cards.shift
      @player2.deck.cards.shift
    elsif type == :war
      @player1.deck.cards.first(3).map do |card|
        @spoils_of_war << card
      end
      @player2.deck.cards.first(3).map do |card|
        @spoils_of_war << card
      end
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    else type == :mutually_assured_destruction
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    end
  end

  def award_spoils (winner)
    if type == :basic || type == :war
      @spoils_of_war.map do |spoil|
        winner.deck.cards << spoil
        @spoils_of_war = []
      end

    end

  end
end
