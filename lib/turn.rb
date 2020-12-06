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
    if @player1.deck.cards.empty? == true
      :basic
    elsif @player2.deck.cards.empty? == true
      :basic
    elsif @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      :basic
    else @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      if @player1.deck.cards.length < 3
        :war
      elsif @player2.deck.cards.length < 3
        :war
      elsif @player1.deck.cards[2].rank != @player2.deck.cards[2].rank
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
      if @player1.deck.cards.empty? == true
        @player2
      elsif @player2.deck.cards.empty? == true
        @player1
      elsif @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        @player1
      else
        @player2
      end
      # if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
      #   if @player2.deck.cards.length < 2
      #     return print "*~*~*~* Megan has won the game! *~*~*~*"
      #   elsif @player2.deck.cards.length >= 2
      #     @player1
      # elsif @player1.deck.cards[0].rank < @player2.deck.cards[0].rank
      #   if @player1.deck.cards.length < 2
      #     return print "*~*~*~* Aurora has won the game! *~*~*~*"
      #   elsif
      #     @player2
      #   end
    elsif type == :war
      if @player1.deck.cards.count < 3 && @player2.deck.cards.count >= 3
        @player2
      elsif @player2.deck.cards.count < 3 && @player1.deck.cards.count >= 3
        @player1
      else @player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3
        if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
          @player1
        else
          @player2
        end
      end
    else type == :mutually_assured_destruction
      if @player1.deck.cards.count < 4 && @player2.deck.cards.count >= 4
        @player2
      elsif @player2.deck.cards.count < 4 && @player1.deck.cards.count >= 4
        @player1
      else @player1.deck.cards.count >= 4 && @player2.deck.cards.count >= 4
        "No winner"
      end
    end
  end

  def pile_cards #ACTION METHOD
    if type == :basic
      if @player1.deck.cards.empty? == true || @player2.deck.cards.empty? == true
      else
        @spoils_of_war << @player1.deck.cards[0]
        @spoils_of_war << @player2.deck.cards[0]
        @player1.deck.cards.shift
        @player2.deck.cards.shift
      end
    elsif type == :war
      if @player1.deck.cards.length < 3 || @player2.deck.cards.length < 3
      else
        @player1.deck.cards.first(3).map do |card|
          @spoils_of_war << card
        end
        @player2.deck.cards.first(3).map do |card|
          @spoils_of_war << card
        end
        @player1.deck.cards.shift(3)
        @player2.deck.cards.shift(3)
      end
    elsif
       type == :mutually_assured_destruction
      if @player1.deck.cards.length < 4 || @player2.deck.cards.length < 4
      else
        @spoils_of_war = []
        @player1.deck.cards.shift(3)
        @player2.deck.cards.shift(3)
      end
    end
  end


    def award_spoils (winner)
      if type == :basic
        if @player1.deck.cards.empty? == true || @player2.deck.cards.empty? == true
          @spoils_of_war = []
        else
        @spoils_of_war.map do |spoil|
          winner.deck.cards << spoil
          @spoils_of_war = []
        end
      end
      elsif type == :war
        if @player1.deck.cards.empty? == true || @player2.deck.cards.empty? == true
          @spoils_of_war = []
        else
        @spoils_of_war.map do |spoil|
          winner.deck.cards << spoil
          @spoils_of_war = []
        end
      end
      else type == :mutually_assured_destruction
        if @player1.deck.cards.empty? == true || @player2.deck.cards.empty? == true
          @spoils_of_war = []
        else
        @spoils_of_war = []
      end
    end
  end
end
